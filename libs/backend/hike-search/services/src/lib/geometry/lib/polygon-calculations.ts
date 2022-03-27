import turfBooleanPointInPolygon from '@turf/boolean-point-in-polygon';
import { Feature, Polygon } from '@turf/helpers';
import { pipe } from 'fp-ts/lib/function';
import * as fp from 'lodash/fp';

export const removePointsOutsideOfPolygon =
  <POINT extends { location: { lat: number; lon: number } }>(
    polygon: Feature<Polygon>,
  ) =>
  (points: POINT[]): POINT[] =>
    pipe(
      points,
      fp.reject(point => fp.some(fp.isUndefined)(point)),
      fp.filter(point => isPointInsidePolygon(polygon, point)),
    );

export function isPointInsidePolygon<
  POINT extends { location: { lat: number; lon: number } },
>(polygon: Feature<Polygon>, point: POINT): boolean {
  return turfBooleanPointInPolygon(
    [point.location.lon, point.location.lat],
    polygon.geometry as Polygon,
  );
}
