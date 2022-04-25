import { Feature, LineString, Position } from '@turf/helpers';

type Point = {
  lat: number;
  lon: number;
};

export interface Circle {
  radius: number;
  center: Point;
}

export type PathType = Feature<LineString>;
export type GeojsonPointType = Position | [number, number, number];
