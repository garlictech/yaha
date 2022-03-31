import * as _ from 'lodash';
import * as fp from 'lodash/fp';
import { forkJoin, from, interval, Observable, of } from 'rxjs';
import { combineAll, map, switchMap, take } from 'rxjs/operators';
import { pipe as fptsPipe } from 'fp-ts/lib/function';
import { map as fptsMap, isSome, Option } from 'fp-ts/lib/Option';
import { ExternalPoi } from './lib/types';
import { Circle, getCenterRadiusOfBox, splitBoundingBox } from '../geometry';
import { YahaApi } from '@yaha/gql-api';
import { LanguageFp } from '../language';
import { buildRetryLogic } from '@yaha/shared/utils';
import { HttpClient } from '../http';
import { Logger } from '../bunyan-logger';

export interface WikipediaDeps {
  http: HttpClient;
}

const get =
  (deps: WikipediaDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    languageCodesShort: string[],
    lng: string,
  ): Observable<ExternalPoi[]> => {
    const resultOption: Option<Observable<ExternalPoi[]>> = fptsPipe(
      getCenterRadiusOfBox(bounds),
      fptsMap((circle: Circle) => {
        const gsLimit = 500;
        const languageKey = LanguageFp.shortToLocale(lng);
        const radius = Math.floor(circle.radius);

        // eslint:disable:max-line-length
        const request = `https://${lng}.wikipedia.org/w/api.php?action=query&list=geosearch&gsradius=${radius}&gscoord=${circle.center.lat}%7C${circle.center.lon}&format=json&gslimit=${gsLimit}&origin=*`;

        // Get basic poi list
        return deps.http.get(request).pipe(
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          map((data: any) =>
            _.get(data, 'query.geosearch', []).map(
              (_point: {
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                pageid: { toString: () => any };
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                lat: any;
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                lon: any;
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                title: any;
              }) => {
                const sourceObject = [
                  {
                    objectType: YahaApi.PoiSource.wikipedia,
                    languageKey,
                    objectId: _point.pageid.toString(),
                    url: `https://${lng}.wikipedia.org/?curid=${_point.pageid}`,
                  },
                ];

                return {
                  lat: _point.lat,
                  lon: _point.lon,
                  types: ['generic:sight'],
                  description: [
                    {
                      languageKey,
                      title: _point.title,
                      type: YahaApi.TextualDescriptionType.html,
                    },
                  ],
                  sourceObject,
                };
              },
            ),
          ),
          switchMap((pois: ExternalPoi[]) =>
            _getPoiDetails(deps)(pois, languageCodesShort),
          ),
          take(1),
          buildRetryLogic({}),
        );
      }),
    );
    return isSome(resultOption) ? resultOption.value : of([]);
  };

const _getPoiDetails =
  (deps: WikipediaDeps) =>
  (
    pois: ExternalPoi[],
    languageCodesShort: string[],
  ): Observable<ExternalPoi[]> => {
    const promises: Promise<ExternalPoi[]>[] = [];

    for (const lng of languageCodesShort) {
      const langPois = _.filter(
        pois,
        p => p.description?.[0]?.languageKey === LanguageFp.shortToLocale(lng),
      );

      promises.push(_getPageExtracts(deps)(langPois, lng));
      // promises.push(this._getPageImages(langPois, lng));
    }

    return from(Promise.all(promises).then(() => pois));
  };

const _getPageExtracts =
  (deps: WikipediaDeps) =>
  async (_pois: ExternalPoi[], lng: string): Promise<ExternalPoi[]> => {
    const _poiIds = _pois.map(
      (p: ExternalPoi) => p.sourceObject?.[0]?.objectId,
    );
    const _chunks = _.chunk(_poiIds, 20);

    return interval(100)
      .pipe(
        take(_chunks.length),
        map(async counter => {
          const _ids = _chunks[counter];
          // eslint:disable:max-line-length
          const request = `https://${lng}.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&exintro&exlimit=max&pageids=${_ids.join(
            '|',
          )}&origin=*`;
          // tslint:enable:max-line-length

          return (
            deps.http
              .get(request)
              .toPromise()
              // eslint-disable-next-line @typescript-eslint/no-explicit-any
              .then((data: any) => {
                for (const idx in data.query.pages) {
                  if (data.query.pages[idx]) {
                    const _exData = data.query.pages[idx];

                    if (_exData.extract) {
                      const _targetPoi = _pois.find(p =>
                        fp.isEqual(
                          p.sourceObject?.[0].objectId,
                          _exData.pageid.toString(),
                        ),
                      );

                      if (_targetPoi?.description?.[0]) {
                        _targetPoi.description[0].summary = _exData.extract;
                      }
                    }
                  }
                }

                return of(counter);
              })
          );
        }),
        combineAll(),
      )
      .toPromise()
      .then(() => _pois);
  };

export const getAllWikipediaPois =
  (deps: WikipediaDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    languageCodesShort: string[],
  ): Observable<ExternalPoi[]> => {
    // eslint-disable-next-line prefer-rest-params
    Logger.info(
      `Wikipedia poi fetch started with params ${JSON.stringify(
        [bounds, languageCodesShort],
        null,
        2,
      )}`,
    );
    const boundsArr: YahaApi.BoundingBox[] = [];
    splitBoundingBox(bounds, 10000, boundsArr);
    const _observables: Observable<ExternalPoi[]>[] = _.flatten(
      languageCodesShort.map(languageCode =>
        boundsArr.map(bound =>
          get(deps)(bound, languageCodesShort, languageCode),
        ),
      ),
    );

    return forkJoin(_observables).pipe(
      map(poisArr => _.uniqBy(_.flatten(poisArr), 'id')),
    );
  };
