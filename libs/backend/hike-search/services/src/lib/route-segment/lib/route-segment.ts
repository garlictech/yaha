import { lineString as turfLineString, Position } from '@turf/helpers';
import turfBuffer from '@turf/buffer';
import {
  Feature,
  FeatureCollection,
  featureCollection as turfFeatureCollection,
  LineString,
  Polygon,
} from '@turf/helpers';
import * as O from 'fp-ts/lib/Option';
import * as NEA from 'fp-ts/lib/NonEmptyArray';
import * as fp from 'lodash/fp';
import { EBuffer } from '../interfaces';
import { RouteSegment } from './types';
import { pipe } from 'fp-ts/lib/function';
import { sequenceS } from 'fp-ts/lib/Apply';
import {
  convertGeojsonPositionToPoint,
  getBoundingBoxOfTrack,
  lineLengthInMeters,
  PathType,
  score,
} from '../../geometry';
import { ElevationFp } from '../../elevation';
import { DifficultyFp } from '../../difficulty';
import { GtrackDefaults } from '../../defaults/defaults';
import { YahaApi } from '@yaha/gql-api';

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
