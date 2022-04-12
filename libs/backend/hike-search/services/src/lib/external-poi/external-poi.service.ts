import { isCreateImageInput } from '../joi-schemas/image-schema';
import * as fp from 'lodash/fp';
import { forkJoin, from, Observable, of } from 'rxjs';
import { catchError, delay, map, toArray, mergeMap } from 'rxjs/operators';
import { ExternalPoi, OsmPoiTypes } from './lib/types';
import { YahaApi } from '@yaha/gql-api';
import { HttpClient } from '../http';
import { getFlickrImages } from './flickr.service';
import { isCreatePoiInput } from '../joi-schemas/poi-schema';
import { getAllWikipediaPois } from './wikipedia-poi.service';

const filterTypes = fp.flow(
  fp.pullAll(['point_of_interest', 'establishment']),
  fp.map(type => (type === 'locality' ? 'city' : type)),
  fp.map(type => (type === 'stop_position' ? 'bus_station' : type)),
  fp.map(type => (type === 'platform' ? 'bus_station' : type)),
  fp.map(type => (type === 'station' ? 'bus_station' : type)),
);

const filterTypesFv = fp.map((item: ExternalPoi) =>
  item.types
    ? {
        ...item,
        types: filterTypes(item.types),
      }
    : item,
);

export interface ExternalPoiServiceDeps {
  googleApiKey: string;
  flickrApiKey: string;
  http: HttpClient;
}

export const getExternalPois =
  (deps: ExternalPoiServiceDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    _allLanguages: string[],
    _alreadyProcessedSourceObjectIds: string[],
  ): Observable<ExternalPoi[]> =>
    forkJoin([
      getAllWikipediaPois(deps)(bounds, ['en', 'hu']),
      //osmPois(getOsmPois(deps))(bounds),
      //     deps.googlePoiService.get(bounds, alreadyProcessedSourceObjectIds),
    ]).pipe(
      map(
        fp.flow(
          fp.flattenDeep,
          filterTypesFv,
          fp.tap(res =>
            console.warn(
              'Number of external poi candidates:',
              res.length,
              JSON.stringify(res, null, 2),
            ),
          ),
          fp.filter(x => isCreatePoiInput(x)),
          fp.tap(res =>
            console.warn('Number of correct external pois:', res.length),
          ),
        ),
      ),
      catchError(err => {
        console.error(`Error in external POI fetch: ${err}`);
        return of([]);
      }),
    );

export const getExternalImages =
  (deps: ExternalPoiServiceDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    _allLanguages: string[],
    _alreadyProcessedSourceObjectIds: string[],
  ): Observable<YahaApi.CreateImageInput[]> =>
    getFlickrImages(deps)(bounds).pipe(
      map(
        fp.flow(
          fp.flattenDeep,
          filterTypesFv,
          fp.tap(res =>
            console.warn('Number of external image candidates:', res.length),
          ),
          fp.filter(isCreateImageInput),
          fp.tap(res =>
            console.warn('Number of correct external images:', res.length),
          ),
        ),
      ),
      catchError(err => {
        console.error(`Error in external IMAGE fetch: ${err}`);
        return of([] as YahaApi.CreateImageInput[]);
      }),
    );

const osmPois =
  (
    osmPoiService: (
      bounds: YahaApi.BoundingBox,
      typeParam: OsmPoiTypes,
    ) => Observable<ExternalPoi[]>,
  ) =>
  (bounds: YahaApi.BoundingBox): Observable<ExternalPoi[]> =>
    from([
      OsmPoiTypes.publicTransport,
      OsmPoiTypes.amenity,
      OsmPoiTypes.natural,
      OsmPoiTypes.emergency,
      OsmPoiTypes.historic,
      OsmPoiTypes.leisure,
      OsmPoiTypes.manMade,
      OsmPoiTypes.military,
      OsmPoiTypes.shop,
      OsmPoiTypes.tourism,
    ]).pipe(
      mergeMap(
        (osmPoiType: OsmPoiTypes) =>
          osmPoiService(bounds, osmPoiType).pipe(delay(2000)),
        1,
      ),
      toArray(),
      map(fp.flatten),
    );
