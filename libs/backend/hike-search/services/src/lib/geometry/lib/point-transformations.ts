import {
  point as turfPoint,
  Position,
  Feature,
  Point as TurfPoint,
} from '@turf/helpers';
import { Option, fromNullable, mapNullable, map } from 'fp-ts/lib/Option';
import { pipe } from 'fp-ts/lib/function';
import { GeoPoint } from './interfaces';

export function convertPointToTurfPoint<
  POINT extends { latitude: number; longitude: number },
>(point: POINT): Feature<TurfPoint> {
  return turfPoint([point.longitude, point.latitude]);
}

export const convertGeojsonPositionToGeoPoint = (
  geojsonPoint: Position,
): GeoPoint => {
  return {
    latitude: geojsonPoint[1],
    longitude: geojsonPoint[0],
    height: geojsonPoint[2],
  };
};

export const convertGeoPointToGeojsonPosition = (point: GeoPoint): Position => {
  return [point.longitude, point.latitude, point.height];
};

export const convertGeojsonPositionToTurfPoint = (
  point: Position,
): Feature<TurfPoint> => {
  return turfPoint(point);
};

export const convertGeojsonPointFeatureToGeoPoint = (
  point: Feature<TurfPoint>,
): Option<GeoPoint> => {
  return pipe(
    fromNullable(point.geometry),
    mapNullable(geometry => geometry.coordinates),
    map((coordinates: Position) => ({
      latitude: coordinates[1],
      longitude: coordinates[0],
      height: coordinates[2],
    })),
  );
};
