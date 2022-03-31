import { YahaApi } from '@yaha/gql-api';
import { Position } from '@turf/helpers';
import { PathType } from '../../geometry';

export enum EBuffer {
  SMALL = 'small',
  BIG = 'big',
}

export const emptyRouteTotals = {
  distance: 0,
  uphill: 0,
  downhill: 0,
  averageTime: 0,
  score: 0,
  currentTime: 0,
};

export type RouteTotals = typeof emptyRouteTotals;

export interface RouteSegment extends RouteTotals {
  coordinates: Position[];
  difficulty: number;
  endPoint: YahaApi.Point;
  startPoint: YahaApi.Point;
  geojsonFeature: PathType;
}
