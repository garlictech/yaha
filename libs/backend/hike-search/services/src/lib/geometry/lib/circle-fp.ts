import { YahaApi } from '@yaha/gql-api';
import * as fp from 'lodash/fp';
import { Circle } from '../interfaces';
import { approximateDistance } from './geospatial-calculations';

export class CircleFp {
  /**
   * Uses the approximate distance formulae, so it can be used inly in small circles
   *
   */
  static filterPointsInSmallCircle(
    points: YahaApi.Waypoint[],
    circle: Circle,
  ): YahaApi.Waypoint[] {
    return fp.filter(fp.curry(CircleFp.isPointInSmallCircle)(circle), points);
  }

  static isPointInSmallCircle(
    circle: Circle,
    point: YahaApi.Waypoint,
  ): boolean {
    return (
      approximateDistance(
        { lat: point.latitude, lon: point.longitude },
        { lat: circle.center.latitude, lon: circle.center.longitude },
      ) <= circle.radius
    );
  }
}
