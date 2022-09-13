import * as R from 'ramda';
import { pipe as fptsPipe, pipe } from 'fp-ts/lib/function';
import { map as fptsMap, isSome, Option } from 'fp-ts/lib/Option';
import * as fp from 'lodash/fp';
import * as _ from 'lodash';
import { from, EMPTY, Observable, of } from 'rxjs';
import {
  catchError,
  concatMap,
  delay,
  expand,
  map,
  mergeAll,
  switchMap,
  toArray,
} from 'rxjs/operators';
import { ExternalPoi } from './lib/types';
import { YahaApi } from '@yaha/gql-api';
import { HttpClient } from '../http';
import { Logger } from '../bunyan-logger';
import { BoundingBox, Circle, getCenterRadiusOfBox } from '../geometry';
import { buildRetryLogic } from '@yaha/shared/utils';

export const PLACE_API_URL = 'https://maps.googleapis.com/maps/api/place';

//const hiddenTypes = ['premise', 'political'];

export interface GooglePoiDeps {
  http: HttpClient;
  apiKey: string;
}

export const getGooglePois =
  (deps: GooglePoiDeps) =>
  (bounds: BoundingBox): Observable<ExternalPoi[]> => {
    // eslint-disable-next-line prefer-rest-params
    const resultOption: Option<Observable<ExternalPoi[]>> = fptsPipe(
      getCenterRadiusOfBox(bounds),
      fptsMap((circle: Circle) => {
        const url = `${PLACE_API_URL}/nearbysearch/json`;

        const getPage = (pagetoken?: string) =>
          fp.flow(
            () => ({
              params: {
                location: `${circle.center.latitude},${circle.center.longitude}`,
                radius: circle.radius.toString(),
                key: deps.apiKey,
                cahcheBreaker: _.uniqueId(Math.random().toString()),
              },
            }),
            httpQueryParams => ({
              params: pagetoken
                ? { ...httpQueryParams.params, pagetoken }
                : httpQueryParams.params,
            }),
            httpQueryParams =>
              deps.http.get(url, httpQueryParams).pipe(
                delay(2000),
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                map((data: any) => ({
                  items: fp.map('place_id')(data.results),
                  pageToken: data.next_page_token,
                })),
              ),
          )();

        return getPage().pipe(
          buildRetryLogic({}),
          expand(({ pageToken }) => (pageToken ? getPage(pageToken) : EMPTY)),
          concatMap(({ items }) => items),
          toArray(),
          switchMap(placeIds => _getPoiDetails(deps)(placeIds)),
        );
      }),
    );

    return isSome(resultOption) ? resultOption.value : of([] as ExternalPoi[]);
  };

const _getPoiDetails =
  (deps: GooglePoiDeps) =>
  (objectIds: string[]): Observable<ExternalPoi[]> => {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const createPoi = (data: any): ExternalPoi => ({
      infoUrl: data.website,
      externalId: `google:${data.place_id}`,
      address: data.formatted_address,
      phoneNumber: data.international_phone_number,
      openingHours: JSON.stringify(_.get(data, 'opening_hours.periods')),
      location: {
        lat: data.geometry.location.lat,
        lon: data.geometry.location.lng,
      },
      description: {
        languageKey: 'en_US',
        title: data.name,
        type: YahaApi.DescriptionType.plaintext,
      },

      type: data?.types?.[0],
    });

    // execute search for the same place on different languages.
    // merge the descriptions
    return fp.isEmpty(objectIds)
      ? of([])
      : pipe(
          objectIds,
          R.map((objectId: string) =>
            from(
              deps.http.get(`${PLACE_API_URL}/details/json`, {
                params: {
                  placeid: objectId,
                  key: deps.apiKey,
                  language: 'en',
                },
              }),
            ),
          ),
          from,
          mergeAll(1),
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          map((x: any) => createPoi(x.result)),
          catchError(err => {
            Logger.error(`Error in google poi fetch: ${err}`);
            return of(undefined);
          }),
          toArray(),
          map(R.reject(R.isNil)),
          map(x => x as ExternalPoi[]),
        );
  };
