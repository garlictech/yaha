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
    points: YahaApi.Point[],
    circle: Circle,
  ): YahaApi.Point[] {
    return fp.filter(fp.curry(CircleFp.isPointInSmallCircle)(circle), points);
  }

  static isPointInSmallCircle(circle: Circle, point: YahaApi.Point): boolean {
    return approximateDistance(point, circle.center) <= circle.radius;
  }
}
