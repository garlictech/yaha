import { isCreateImageInput } from '../joi-schemas/image-schema';
import * as fp from 'lodash/fp';
import { forkJoin, from, Observable, of } from 'rxjs';
import { catchError, delay, map, toArray, mergeMap } from 'rxjs/operators';
import { ExternalImage, ExternalPoi, OsmPoiTypes } from './lib/types';
import { YahaApi } from '@yaha/gql-api';
import { HttpClient } from '../http';
import { getFlickrImages } from './flickr.service';
import { isCreatePoiInput } from '../joi-schemas/poi-schema';
import { getAllWikipediaPois } from './wikipedia-poi.service';
import { getOsmPois } from './osm-poi.service';
import { getGooglePois } from './google-poi.service';

const filterTypes = fp.flow(
  type => (type === 'locality' ? 'city' : type),
  type => (type === 'stop_position' ? 'bus_station' : type),
  type => (type === 'platform' ? 'bus_station' : type),
  type => (type === 'station' ? 'bus_station' : type),
);

const filterTypesFv = fp.map((item: ExternalPoi) =>
  item.type
    ? {
        ...item,
        type: filterTypes(item.type),
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
    allLanguages: string[],
  ): Observable<ExternalPoi[]> =>
    forkJoin([
      getAllWikipediaPois(deps)(bounds, allLanguages),
      osmPois(getOsmPois(deps))(bounds),
      getGooglePois({
        apiKey: deps.googleApiKey,
        http: deps.http,
      })(bounds),
    ]).pipe(
      map(
        fp.flow(
          fp.flattenDeep,
          filterTypesFv,
          /*fp.tap(res =>
            console.warn('Number of external poi candidates:', res.length),
          ),*/
          fp.tap(res => console.warn('externalPoi', res)),
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
  ): Observable<ExternalImage[]> =>
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
        return of([] as ExternalImage[]);
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
