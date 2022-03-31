import * as fp from 'lodash/fp';
import { EMPTY, Observable } from 'rxjs';
import { concatMap, delay, expand, map, toArray } from 'rxjs/operators';
import { YahaApi } from '@yaha/gql-api';
import { GtrackDefaults } from '../defaults/defaults';
import { HttpClient } from '../http';
import { Logger } from '../bunyan-logger';
import { buildRetryLogic } from '@yaha/shared/utils';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const createImageObject = (data: any): YahaApi.CreateImageInput => ({
  location: {
    lat: data.latitude,
    lon: data.longitude,
  },
  sourceObject: {
    objectType: YahaApi.PoiSource.flickr,
    objectId: data.id,
  },
  original: {
    // DOCS: https://www.flickr.com/services/api/misc.urls.html
    url: data.url_o || data.url_k || data.url_h,
    width: data.width_o || data.width_k || data.width_h,
  },
  card: {
    url: data.url_z,
    width: parseInt(data.width_z, 10) || GtrackDefaults.cardImageWidthInPixel(),
  },
  thumbnail: {
    url: data.url_n,
    width: parseInt(data.width_n, 10) || GtrackDefaults.thumbnailWidthInPixel(),
  },
});

export interface FlickrPoiDeps {
  http: HttpClient;
  flickrApiKey: string;
}

export const getFlickrImages =
  (deps: FlickrPoiDeps) =>
  (bounds: YahaApi.BoundingBox): Observable<YahaApi.CreateImageInput[]> => {
    // eslint-disable-next-line prefer-rest-params
    Logger.info(
      `Flickr poi fetch started with params ${JSON.stringify(bounds, null, 2)}`,
    );

    const url = 'https://api.flickr.com/services/rest/';

    const getPage = (page: number) =>
      fp.flow(
        () => ({
          params: {
            method: 'flickr.photos.search',
            api_key: deps.flickrApiKey,
            bbox: `${bounds.SouthWest.lon},${bounds.SouthWest.lat},${bounds.NorthEast.lon},${bounds.NorthEast.lat}`,
            privacy_filter: '1',
            content_type: '1',
            extras: 'geo,description,license,url_n,url_z,url_o,url_k,url_h',
            format: 'json',
            nojsoncallback: '1',
            cahcheBreaker: fp.uniqueId(Math.random().toString()),
          },
        }),
        httpQueryParams => ({
          params: page
            ? { ...httpQueryParams.params, page: page.toString() }
            : httpQueryParams.params,
        }),
        httpQueryParams =>
          deps.http.get(url, httpQueryParams).pipe(
            delay(2000),
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            map((data: any) => ({
              items: fp.flow(
                fp.get('photos.photo'),
                fp.map(createImageObject),
              )(data),
              pageToken:
                data.photos.page < data.photos.pages ? page + 1 : undefined,
            })),
          ),
      )();

    return getPage(1).pipe(
      expand(({ pageToken }) => (pageToken ? getPage(pageToken) : EMPTY)),
      concatMap(({ items }) => items as YahaApi.CreateImageInput[]),
      toArray(),
      buildRetryLogic({}),
    );
  };
