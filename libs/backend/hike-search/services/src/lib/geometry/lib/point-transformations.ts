import { YahaApi } from '@yaha/gql-api';
import {
  point as turfPoint,
  Position,
  Feature,
  Point as TurfPoint,
} from '@turf/helpers';
import { Option, fromNullable, mapNullable, map } from 'fp-ts/lib/Option';
import { pipe } from 'fp-ts/lib/function';

export function convertPointToTurfPoint<
  POINT extends { latitude: number; longitude: number },
>(point: POINT): Feature<TurfPoint> {
  return turfPoint([point.longitude, point.latitude]);
}

export const convertGeojsonPositionToPoint = (
  geojsonPoint: Position,
): YahaApi.Point => {
  return {
    lat: geojsonPoint[1],
    lon: geojsonPoint[0],
    ele: geojsonPoint[2],
  };
};

export const convertPointToGeojsonPosition = (
  point: YahaApi.Point,
): Position => {
  return [point.lon, point.lat, point.ele as number];
};

export const convertGeojsonPositionToTurfPoint = (
  point: Position,
): Feature<TurfPoint> => {
  return turfPoint(point);
};

export const convertGeojsonPointFeatureToPoint = (
  point: Feature<TurfPoint>,
): Option<YahaApi.Point> => {
  return pipe(
    fromNullable(point.geometry),
    mapNullable(geometry => geometry.coordinates),
    map((coordinates: Position) => ({
      lat: coordinates[1],
      lon: coordinates[0],
      ele: coordinates[2],
    })),
  );
};
