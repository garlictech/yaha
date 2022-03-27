import { googleElevationService, googleMapsDeps } from '../google-maps';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import { getElevationOfPoints } from './services/elevation.service';

export const getElevationOfPointsFromGoogle = <
  POINT extends { location: { lat: number; lon: number } },
>(
  points: POINT[],
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): OE.ObservableEither<any, POINT[]> =>
  getElevationOfPoints(points)(googleElevationService(googleMapsDeps));
