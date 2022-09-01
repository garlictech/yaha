import * as fp from 'lodash/fp';
import { EMPTY, Observable } from 'rxjs';
import { concatMap, delay, expand, map, tap, toArray } from 'rxjs/operators';
import { HttpClient } from '../http';
import { YahaApi } from '@yaha/gql-api';
import { ExternalImage } from './lib/types';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const createImageObject = (data: any): ExternalImage => ({
  location: {
    lat: data.latitude,
    lon: data.longitude,
  },
  externalId: `flickr:${data.id}`,
  original: data.url_o || data.url_k || data.url_h,
  card: data.url_z,
  thumbnail: data.url_n,
});

export interface FlickrPoiDeps {
  http: HttpClient;
  flickrApiKey: string;
}

export const getFlickrImages =
  (deps: FlickrPoiDeps) =>
  (bounds: YahaApi.BoundingBox): Observable<ExternalImage[]> => {
    const url = 'https://api.flickr.com/services/rest/';
    console.log('Start searching for flickr images...');

    const getPage = (page: number) =>
      fp.flow(
        () => ({
          params: {
            method: 'flickr.photos.search',
            api_key: deps.flickrApiKey,
            bbox: `${bounds.SouthWest.longitude},${bounds.SouthWest.latitude},${bounds.NorthEast.longitude},${bounds.NorthEast.latitude}`,
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
      concatMap(({ items }) => items as ExternalImage[]),
      toArray(),
      tap(res => console.log(`Found ${res.length} flickr images`)),
    );
  };
