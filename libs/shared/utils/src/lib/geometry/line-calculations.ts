import length from '@turf/length';
import turfLength from '@turf/length';
import lineSlice from '@turf/line-slice';
import nearestPointOnLine from '@turf/nearest-point-on-line';
import { PathType } from './interfaces';
import * as O from 'fp-ts/lib/Option';
import { pipe } from 'fp-ts/lib/function';
import * as R from 'ramda';
import {
  circle,
  distance,
  envelope,
  featureCollection as turfFeatureCollection,
  lineString as turfLineString,
  FeatureCollection,
  Feature,
  LineString,
  Position,
  midpoint,
  AllGeoJSON,
  featureCollection,
  Properties,
} from '@turf/turf';
import { geoBounds as d3GeoBounds } from 'd3-geo';
import rewind from 'geojson-rewind';
import * as fp from 'lodash/fp';
import {
  convertGeojsonPointFeatureToPoint,
  convertGeojsonPositionToTurfPoint,
  convertPointToTurfPoint,
} from './point-transformations';
import { Option, chain, some, isSome } from 'fp-ts/lib/Option';
import lineChunk from '@turf/line-chunk';

export interface LatLon {
  lat: number;
  lon: number;
}

export interface Circle {
  radius: number;
  center: LatLon;
}

export interface BoundingBox {
  NorthEast: LatLon;
  SouthWest: LatLon;
}

export function distanceFromRoute<POINT extends LatLon>(
  point: POINT,
  path: Feature<LineString>,
): number {
  const tPoint = convertPointToTurfPoint(point);
  const pointOnRoute = nearestPointOnLine(path, tPoint);

  return Math.round(
    distance(tPoint, pointOnRoute, { units: 'kilometers' }) * 1000,
  );
}

/** Calculate the linestring between two snapped pontint of a linestring. First,
 * snap all the points to the line, then return the slice between the
 * snapped points.-m-20 */
export function snappedLineSlice<
  POINT1 extends { lat: number; lon: number; elevation?: number },
  POINT2 extends { lat: number; lon: number; elevation?: number },
>(start: POINT1, end: POINT2, path: Feature<LineString>): Feature<LineString> {
  return pipe(
    lineSlice(
      convertPointToTurfPoint(start),
      convertPointToTurfPoint(end),
      path,
    ),
    slice => {
      const coords = slice.geometry.coordinates;

      if (
        coords.length >= 1 &&
        start.elevation != undefined &&
        end.elevation != undefined
      ) {
        coords[0][2] = start.elevation;
        coords[coords.length - 1][2] = end.elevation;
      }

      return slice;
    },
  );
}
/**
 * Snap points to the given line and return with the segment's length, plus the point distances from the path.
 */
export function distanceOnLine<POINT1 extends LatLon, POINT2 extends LatLon>(
  start: POINT1,
  end: POINT2,
  path: Feature<LineString>,
): number {
  const startDistanceFromPath = distanceFromRoute(start, path);
  const endDistanceFromPath = distanceFromRoute(end, path);
  const pathBetweenSnappedPoints = snappedLineSlice(start, end, path);
  const snappedPathLength =
    length(pathBetweenSnappedPoints, { units: 'kilometers' }) * 1000;

  return startDistanceFromPath + endDistanceFromPath + snappedPathLength;
}

export const lineLengthInMeters = (
  lineCoordinates: Position[],
): O.Option<number> =>
  O.tryCatch(
    () =>
      turfLength(turfLineString(lineCoordinates), { units: 'kilometers' }) *
      1000,
  );

export const lineStringLengthInMeters = (line: PathType): O.Option<number> =>
  pipe(
    O.fromNullable(line?.geometry?.coordinates),
    O.chain(lineLengthInMeters),
  );

export const distanceOnLineForFlutter = (
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  start: any,
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  end: any,
  path: Feature<LineString, Properties>,
) => {
  return distanceOnLine(start, end, path).toString();
};

export const getPaddedBoundingBoxOfFeature = (
  features: AllGeoJSON,
  padding = 0,
): BoundingBox => {
  const d3Bounds = d3GeoBounds(rewind(features, true));

  return {
    SouthWest: {
      lat: d3Bounds[0][1] + padding,
      lon: d3Bounds[0][0] + padding,
    },
    NorthEast: {
      lat: d3Bounds[1][1] - padding,
      lon: d3Bounds[1][0] - padding,
    },
  };
};

// about 330m padding
export const getPaddedBoxOfTrack = (track: Feature<LineString>): BoundingBox =>
  getPaddedBoundingBoxOfFeature(track, 0.003);

export const getBoundingBoxOfTrack = (features: AllGeoJSON): BoundingBox =>
  getPaddedBoundingBoxOfFeature(features);

export const getCenterRadiusOfBox = (bounds: BoundingBox): Option<Circle> => {
  const p1 = convertPointToTurfPoint(bounds.SouthWest);
  const p2 = convertPointToTurfPoint(bounds.NorthEast);

  return pipe(
    midpoint(p1, p2),
    convertGeojsonPointFeatureToPoint,
    chain((center: LatLon) =>
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

export const boundingBoxOfPaths = (paths: LineString[]): BoundingBox | null => {
  return fp.flow(
    envelopeOfPaths,
    O.map(bounds => ({
      SouthWest: { lat: bounds[0][0], lon: bounds[0][1] },
      NorthEast: { lat: bounds[1][0], lon: bounds[1][1] },
    })),
    O.getOrElse(() => null),
  )(paths);
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
          SouthWest: { lat: bounds.SouthWest.lat, lon: bounds.SouthWest.lon },
          NorthEast: geo.center,
        },
        maxRadius,
        boundsArr,
      );
      splitBoundingBox(
        {
          SouthWest: { lat: geo.center.lat, lon: bounds.SouthWest.lon },
          NorthEast: { lat: bounds.NorthEast.lat, lon: geo.center.lon },
        },
        maxRadius,
        boundsArr,
      );
      splitBoundingBox(
        {
          SouthWest: { lat: bounds.SouthWest.lat, lon: geo.center.lon },
          NorthEast: { lat: geo.center.lat, lon: bounds.NorthEast.lon },
        },
        maxRadius,
        boundsArr,
      );
      splitBoundingBox(
        {
          SouthWest: geo.center,
          NorthEast: { lat: bounds.NorthEast.lat, lon: bounds.NorthEast.lon },
        },
        maxRadius,
        boundsArr,
      );
    }
  }
};

export const getFixedDistanceCoordinates = (
  path: LineString,
  chunkLengthInKm: number,
) =>
  pipe(
    lineChunk(path, chunkLengthInKm, {
      units: 'kilometers',
    }),
    x => x.features,
    R.map(x => R.last(x.geometry.coordinates)),
    R.reject(R.isNil),
    R.map(x => ({ lon: x[0], lat: x[1] })),
  );

// eslint-disable-next-line @typescript-eslint/no-explicit-any
(global as any).distanceOnLineForFlutter = distanceOnLineForFlutter;
// eslint-disable-next-line @typescript-eslint/no-explicit-any
(global as any).boundingBoxOfPaths = (paths: LineString[]): string => {
  return JSON.stringify(boundingBoxOfPaths(paths));
};
// eslint-disable-next-line @typescript-eslint/no-explicit-any
(global as any).snappedLineSlice = (start: any, end: any, path: any): string =>
  pipe(snappedLineSlice(start, end, path), JSON.stringify);
// eslint-disable-next-line @typescript-eslint/no-explicit-any
(global as any).getFixedDistanceCoordinates = (
  path: LineString,
  chunkLengthInKm: number,
) => {
  return JSON.stringify(getFixedDistanceCoordinates(path, chunkLengthInKm));
};
