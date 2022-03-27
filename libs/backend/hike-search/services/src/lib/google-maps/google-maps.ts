import {
  Client,
  ElevationResponse,
  ReverseGeocodeResponse,
  AddressType,
} from '@googlemaps/google-maps-services-js';
import { Observable, from, of } from 'rxjs';
import * as E from 'fp-ts/lib/Either';
import { pipe } from 'fp-ts/lib/function';
import * as fp from 'lodash/fp';
import { map, catchError } from 'rxjs/operators';

export type GoogleMapsDeps = {
  apiKey: string;
  client: Client;
};

export const googleElevationService = <
  POINT extends { location: { lat: number; lon: number } },
>(
  deps: GoogleMapsDeps,
): {
  getElevationForLocations(
    points: POINT[],
  ): Observable<E.Either<unknown, number[]>>;
} => ({
  getElevationForLocations: (
    points: POINT[],
  ): Observable<E.Either<unknown, number[]>> =>
    pipe(
      points,
      fp.map(({ location: { lat, lon } }) => ({ lat, lng: lon })),
      locations =>
        deps.client.elevation({
          params: {
            locations,
            key: deps.apiKey,
          },
          timeout: 1000, // milliseconds
        }),
      x => from(x),
      map(
        fp.flow(
          (response: ElevationResponse) => response?.data.results,
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          fp.map((result: any) => result?.elevation),
          E.fromPredicate(
            results =>
              results?.length === points?.length &&
              fp.every(fp.isNumber, results),
            data =>
              new Error(
                `Wrong elevation data returned: ${JSON.stringify(
                  data,
                  null,
                  2,
                )}`,
              ),
          ),
        ),
      ),
      catchError(err => of(E.left(err))),
    ),
});

export const googleReverseGeocodingService = <
  POINT extends { lat: number; lon: number },
>(
  deps: GoogleMapsDeps,
): {
  getCity(point: POINT): Observable<E.Either<unknown, string>>;
} => ({
  getCity: (point: POINT): Observable<E.Either<unknown, string>> =>
    pipe(
      point,
      ({ lat, lon }) => ({ lat, lng: lon }),
      latlng =>
        deps.client.reverseGeocode({ params: { latlng, key: deps.apiKey } }),
      x => from(x),
      map(
        fp.flow(
          (response: ReverseGeocodeResponse) => response?.data?.results,
          E.fromNullable('Wrong reverse geocoding result'),
          E.map(results => {
            const _parts: Record<string, string> = {};

            for (const res of results) {
              for (const component of res.address_components) {
                for (const type of [
                  AddressType.locality,
                  AddressType.country,
                  AddressType.administrative_area_level_1,
                ]) {
                  if (component.types.indexOf(type) >= 0) {
                    _parts[type] = component.long_name;
                  }
                  if (type === AddressType.country) {
                    _parts.country = component.short_name;
                  }
                }
              }
            }

            if (_parts.administrative_area_level_1 === _parts.locality) {
              delete _parts.administrative_area_level_1;
            }

            let _ret = _parts.locality || '';

            if (_parts.country) {
              _ret += `, ${_parts.country}`;
            }

            return _ret;
          }),
        ),
      ),
      catchError(err => of(E.left(err))),
    ),
});
