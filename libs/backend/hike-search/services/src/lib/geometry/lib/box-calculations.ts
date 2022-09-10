import * as O from 'fp-ts/lib/Option';
import { pipe } from 'fp-ts/lib/function';
import {
  circle,
  distance,
  envelope,
  bbox,
  featureCollection as turfFeatureCollection,
  lineString as turfLineString,
  FeatureCollection,
  Feature,
  LineString,
  Position,
  midpoint,
  AllGeoJSON,
  featureCollection,
} from '@turf/turf';
import * as fp from 'lodash/fp';
import { BoundingBox, Circle } from './interfaces';
import {
  convertGeojsonPointFeatureToGeoPoint,
  convertGeojsonPositionToTurfPoint,
  convertPointToTurfPoint,
} from './point-transformations';
import { Option, chain, some, isSome } from 'fp-ts/lib/Option';

export const getPaddedBoundingBoxOfFeature = (
  features: AllGeoJSON,
  padding = 0,
) => {
  const env = bbox(features);

  return {
    SouthWest: {
      latitude: env[1] + padding,
      longitude: env[0] + padding,
      height: 0,
    },
    NorthEast: {
      latitude: env[3] - padding,
      longitude: env[2] - padding,
      height: 0,
    },
  };
};

// about 330m padding
export const getPaddedBoxOfTrack = (track: Feature<LineString>) =>
  getPaddedBoundingBoxOfFeature(track, 0.003);

export const getBoundingBoxOfTrack = (features: AllGeoJSON) =>
  getPaddedBoundingBoxOfFeature(features);

export const getCenterRadiusOfBox = (bounds: BoundingBox): Option<Circle> => {
  const p1 = convertPointToTurfPoint(bounds.SouthWest);
  const p2 = convertPointToTurfPoint(bounds.NorthEast);

  return pipe(
    midpoint(p1, p2),
    convertGeojsonPointFeatureToGeoPoint,
    chain(center =>
      some({
        radius: distance(p1, p2, { units: 'kilometers' }) * 500,
        center,
      }),
    ),
  );
};

const fetchEnvelopeCoordinates = (
  featureCollection: FeatureCollection,
): [Position, Position] | null => {
  const env = envelope(featureCollection);

  if (env.geometry) {
    const coordinates = env.geometry.coordinates[0];

    return [
      [coordinates[0][1], coordinates[0][0]],
      [coordinates[2][1], coordinates[2][0]],
    ];
  } else {
    return null;
  }
};

export const envelopeOfPoints = (
  points: Position[],
): [Position, Position] | null => {
  const features = points.map(point =>
    convertGeojsonPositionToTurfPoint(point),
  );
  const featureCollection = turfFeatureCollection(features);
  return fetchEnvelopeCoordinates(featureCollection);
};

export const envelopeOfPaths = (
  paths: LineString[],
): O.Option<[Position, Position]> => {
  return pipe(
    paths,
    fp.map(path => path.coordinates),
    fp.map(x => turfLineString(x)),
    turfFeatureCollection,
    fetchEnvelopeCoordinates,
    O.fromNullable,
  );
};

export const boundingBoxOfPaths = (paths: LineString[]): BoundingBox => {
  return fp.flow(envelopeOfPaths, (bounds: [Position, Position]) => ({
    SouthWest: { lat: bounds[0][0], lon: bounds[0][1] },
    NorthEast: { lat: bounds[1][0], lon: bounds[1][1] },
  }))(paths);
};

export const envelopeOfCircle = (
  center: Position,
  radius: number,
): [Position, Position] | null => {
  const centerPoint = convertGeojsonPositionToTurfPoint(center);
  const crcl = circle(centerPoint, Math.ceil(radius / 1000));
  return pipe([crcl], featureCollection, fetchEnvelopeCoordinates);
};

export const splitBoundingBox = (
  bounds: BoundingBox,
  maxRadius: number,
  boundsArr: BoundingBox[],
): void => {
  const center = getCenterRadiusOfBox(bounds);

  if (isSome(center)) {
    if (center.value.radius < maxRadius) {
      boundsArr.push(bounds);
    } else {
      const geo = center.value;
      // Chech quarter rectangles
      splitBoundingBox(
        {
          SouthWest: {
            latitude: bounds.SouthWest.latitude,
            longitude: bounds.SouthWest.longitude,
            height: 0,
          },
          NorthEast: {
            latitude: geo.center.latitude,
            longitude: geo.center.longitude,
            height: 0,
          },
        },
        maxRadius,
        boundsArr,
      );
      splitBoundingBox(
        {
          SouthWest: {
            latitude: geo.center.latitude,
            longitude: bounds.SouthWest.longitude,
            height: 0,
          },
          NorthEast: {
            latitude: bounds.NorthEast.latitude,
            longitude: geo.center.longitude,
            height: 0,
          },
        },
        maxRadius,
        boundsArr,
      );
      splitBoundingBox(
        {
          SouthWest: {
            latitude: bounds.SouthWest.latitude,
            longitude: geo.center.longitude,
            height: 0,
          },
          NorthEast: {
            latitude: geo.center.latitude,
            longitude: bounds.NorthEast.longitude,
            height: 0,
          },
        },
        maxRadius,
        boundsArr,
      );
      splitBoundingBox(
        {
          SouthWest: {
            latitude: geo.center.latitude,
            longitude: geo.center.longitude,
            height: 0,
          },
          NorthEast: {
            latitude: bounds.NorthEast.latitude,
            longitude: bounds.NorthEast.longitude,
            height: 0,
          },
        },
        maxRadius,
        boundsArr,
      );
    }
  }
};
