import turfBuffer from '@turf/buffer';
import {
  Feature,
  FeatureCollection,
  featureCollection as turfFeatureCollection,
  LineString,
  Polygon,
} from '@turf/helpers';
import * as fp from 'lodash/fp';
import { EBuffer } from '../interfaces';
import { RouteSegment } from './types';
import { getBoundingBoxOfTrack, PathType } from '../../geometry';
import { GtrackDefaults } from '../../defaults/defaults';

const calculateTime = (
  distance: number,
  uphill: number,
  speed: number,
): number => {
  const distanceInKm = distance / 1000;
  let time = (distanceInKm / speed) * 60; // minutes

  time += Math.round(uphill / 10);

  return time;
};

export class RouteSegmentFp {
  static timeWhenSpeedIs(speed: number, segment: RouteSegment): number {
    return calculateTime(segment.distance, segment.uphill, speed);
  }

  static calculateBufferOfLines =
    (whichBuffer: EBuffer) =>
    (lines: FeatureCollection<LineString>): FeatureCollection<Polygon> =>
      turfBuffer(
        lines,
        whichBuffer === EBuffer.SMALL
          ? GtrackDefaults.smallRouteBufferSize()
          : GtrackDefaults.bigRouteBufferSize(),
        {
          units: 'meters',
        },
      );

  static calculateBufferOfLine =
    (whichBuffer: EBuffer) =>
    (line: PathType): Feature<Polygon> =>
      turfBuffer(
        line,
        whichBuffer === EBuffer.SMALL
          ? GtrackDefaults.smallRouteBufferSize()
          : GtrackDefaults.bigRouteBufferSize(),
        {
          units: 'meters',
        },
      );

  static calculatePoiSearchBox(path: PathType | PathType[]) {
    const featureCollection = turfFeatureCollection(
      fp.isArray(path) ? path : [path],
    );
    const _buffer = RouteSegmentFp.calculateBufferOfLines(EBuffer.BIG)(
      featureCollection,
    );
    return fp.memoize(getBoundingBoxOfTrack)(_buffer);
  }
}
