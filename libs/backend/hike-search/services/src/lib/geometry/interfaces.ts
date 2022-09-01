import { YahaApi } from '@yaha/gql-api';
import { Feature, LineString, Position } from '@turf/helpers';

export interface Circle {
  radius: number;
  center: YahaApi.Waypoint;
}

export type PathType = Feature<LineString>;
export type GeojsonPointType = Position | [number, number, number];
