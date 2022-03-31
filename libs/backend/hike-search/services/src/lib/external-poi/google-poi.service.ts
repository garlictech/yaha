import * as Joi from 'joi';
import { pipe as fptsPipe } from 'fp-ts/lib/function';
import { map as fptsMap, isSome, Option } from 'fp-ts/lib/Option';
import * as fp from 'lodash/fp';
import * as _ from 'lodash';
import { EMPTY, forkJoin, Observable, of } from 'rxjs';
import {
  catchError,
  concatMap,
  delay,
  expand,
  map,
  switchMap,
  take,
  toArray,
} from 'rxjs/operators';
import { ExternalPoiFp } from './lib/external-poi.fp';
import { ExternalPoi } from './lib/types';
import { YahaApi } from '@yaha/gql-api';
import { HttpClient } from '../http';
import { validateSchema } from '../joi-validator';
import { Logger } from '../bunyan-logger';
import { Circle, getCenterRadiusOfBox } from '../geometry';
import { buildRetryLogic } from '@yaha/shared/utils';
import { latitudeSchema, longitudeSchema } from '../joi-schemas';

export const PLACE_API_URL = 'https://maps.googleapis.com/maps/api/place';

//const hiddenTypes = ['premise', 'political'];

interface GoogleData {
  objectType?: YahaApi.PoiSource;
  languageKey?: string;
  place_id: string;
  website?: string;
  formatted_address?: string;
  international_phone_number?: string;
  geometry: {
    location: {
      lat: number;
      lng: number;
    };
  };
  name?: string;
  types?: string[];
}

export interface GooglePoiDeps {
  http: HttpClient;
  apiKey: string;
}

const googleDataSchema = Joi.object().keys({
  objectType: Joi.string().required(),
  languageKey: Joi.string(),
  place_id: Joi.string().required(),
  website: Joi.string(),
  formatted_address: Joi.string(),
  international_phone_number: Joi.string(),
  geometry: {
    location: {
      lat: latitudeSchema,
      lng: longitudeSchema,
    },
  },
  name: Joi.string(),
  types: Joi.array().items(Joi.string()),
});

export const { validate: validateGoogleData, isType: isGoogleData } =
  validateSchema<GoogleData>(googleDataSchema);

export const getGooglePois =
  (deps: GooglePoiDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    alreadyProcessedSourceObjectIds: string[] = [],
  ): Observable<YahaApi.CreatePoiInput[]> => {
    // eslint-disable-next-line prefer-rest-params
    Logger.info(
      `Google poi fetch started with params ${JSON.stringify(
        [bounds, alreadyProcessedSourceObjectIds],
        null,
        2,
      )}`,
    );

    const resultOption: Option<Observable<YahaApi.CreatePoiInput[]>> = fptsPipe(
      getCenterRadiusOfBox(bounds),
      fptsMap((circle: Circle) => {
        const url = `${PLACE_API_URL}/nearbysearch/json`;

        const getPage = (pagetoken?: string) =>
          fp.flow(
            () => ({
              params: {
                location: `${circle.center.lat},${circle.center.lon}`,
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
          switchMap(placeIds =>
            _getPoiDetails(deps)(placeIds, alreadyProcessedSourceObjectIds),
          ),
        );
      }),
    );

    return isSome(resultOption)
      ? resultOption.value
      : of([] as YahaApi.CreatePoiInput[]);
  };

const _getPoiDetails =
  (deps: GooglePoiDeps) =>
  (
    objectIds: string[],
    alreadyProcessedSourceObjectIds: string[],
  ): Observable<YahaApi.CreatePoiInput[]> => {
    const pickUsedFields = (data: unknown, schema: unknown): GoogleData =>
      fp.flow(
        () => fp.keys(schema),
        schemaKeys => fp.pick(schemaKeys, data) as unknown as GoogleData,
        data => ({
          ...data,
          geometry: {
            location: data && data.geometry && data.geometry.location,
          },
        }),
      )();

    const createPoi = (data: GoogleData): ExternalPoi | undefined =>
      isGoogleData(data)
        ? {
            sourceObject: [
              {
                objectType: YahaApi.PoiSource.google,
                languageKey: 'en_US',
                objectId: data.place_id,
                url: data.website,
              },
            ],
            address: data.formatted_address,
            phoneNumber: data.international_phone_number,
            openingHours: _.get(data, 'opening_hours.periods'),
            location: {
              lat: data.geometry.location.lat,
              lon: data.geometry.location.lng,
            },
            description: [
              {
                languageKey: 'en_US',
                title: data.name,
                type: YahaApi.TextualDescriptionType.markdown,
              },
            ],
            types: data.types,
            elevation: -1,
            id: '',
          }
        : undefined;

    const newObjectIds = fp.flow(
      fp.filter(
        (objectId: string) =>
          !fp.includes(
            ExternalPoiFp.idFromSourceObject(
              YahaApi.PoiSource.google,
              objectId,
            ),
            alreadyProcessedSourceObjectIds,
          ),
      ),
    )(objectIds);

    // execute search for the same place on different languages.
    // merge the descriptions
    return fp.isEmpty(newObjectIds)
      ? of([])
      : forkJoin(
          fp.map((objectId: string) =>
            deps.http
              .get(`${PLACE_API_URL}/details/json`, {
                params: {
                  placeid: objectId,
                  key: deps.apiKey,
                  language: 'en',
                },
              })
              .pipe(
                take(1),
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                map((response: any) => {
                  const returnedPoiData = pickUsedFields(
                    response.result,
                    googleDataSchema,
                  );
                  const externalPoi = createPoi(returnedPoiData);

                  return externalPoi || [];
                }),
                catchError(err => {
                  Logger.error(`Error in google poi fetch ${objectId}: ${err}`);
                  return of([]);
                }),
              ),
          )(newObjectIds),
        ).pipe(map(fp.flatten));
  };
