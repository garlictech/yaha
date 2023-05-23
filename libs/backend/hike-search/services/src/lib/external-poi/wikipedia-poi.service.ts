import * as _ from 'lodash';
import * as fp from 'lodash/fp';
import { forkJoin, from, interval, Observable, of } from 'rxjs';
import { combineAll, map, switchMap, take, tap } from 'rxjs/operators';
import { pipe as fptsPipe } from 'fp-ts/lib/function';
import { map as fptsMap, isSome, Option } from 'fp-ts/lib/Option';
import { ExternalPoi } from './lib/types';
import {
  BoundingBox,
  Circle,
  getCenterRadiusOfBox,
  splitBoundingBox,
} from '../geometry';
import { YahaApi } from '@yaha/gql-api';
import { LanguageFp } from '../language';
import { buildRetryLogic } from '@yaha/shared/utils';
import { HttpClient } from '../http';

export interface WikipediaDeps {
  http: HttpClient;
}

const get =
  (deps: WikipediaDeps) =>
  (
    bounds: BoundingBox,
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
        const request = `https://${lng}.wikipedia.org/w/api.php?action=query&list=geosearch&gsradius=${radius}&gscoord=${circle.center.latitude}%7C${circle.center.longitude}&format=json&gslimit=${gsLimit}&origin=*`;

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
                return {
                  location: {
                    lat: _point.lat,
                    lon: _point.lon,
                  },
                  type: 'tourism:sight',
                  infoUrl: `https://${lng}.wikipedia.org/?curid=${_point.pageid}`,
                  description: {
                    languageKey,
                    title: _point.title,
                    type: YahaApi.DescriptionType.html,
                  },
                  externalId: `wikipedia:${_point.pageid.toString()}`,
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
        p => p.description?.languageKey === LanguageFp.shortToLocale(lng),
      );

      promises.push(_getPageExtracts(deps)(langPois, lng));
      // promises.push(this._getPageImages(langPois, lng));
    }

    return from(Promise.all(promises).then(() => pois));
  };

const _getPageExtracts =
  (deps: WikipediaDeps) =>
  async (_pois: ExternalPoi[], lng: string): Promise<ExternalPoi[]> => {
    const getWikiId = (externalId: string) => externalId.split(':')[1];
    const _poiIds = _pois.map((p: ExternalPoi) => getWikiId(p.externalId));
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
                          getWikiId(p.externalId),
                          _exData.pageid.toString(),
                        ),
                      );

                      if (_targetPoi?.description) {
                        _targetPoi.description.summary = _exData.extract;
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
    bounds: BoundingBox,
    languageCodesShort: string[],
  ): Observable<ExternalPoi[]> => {
    console.log('Searching for wikipedia pois...');
    const boundsArr: BoundingBox[] = [];
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
      tap(res => console.log(`Found ${res.length} Wikipedia pois`)),
    );
  };
