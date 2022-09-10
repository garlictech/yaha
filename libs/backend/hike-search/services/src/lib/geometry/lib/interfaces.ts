import { Feature, LineString, Position } from '@turf/helpers';

export type PathType = Feature<LineString>;
export type GeojsonPointType = Position | [number, number, number];

export interface GeoPoint {
  latitude: number;
  longitude: number;
  height: number;
}

export interface BoundingBox {
  NorthEast: GeoPoint;
  SouthWest: GeoPoint;
}

export interface Circle {
  radius: number;
  center: GeoPoint;
}
