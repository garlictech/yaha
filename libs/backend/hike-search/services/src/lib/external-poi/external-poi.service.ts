import * as fp from 'lodash/fp';
import { forkJoin, from, Observable, of } from 'rxjs';
import { catchError, delay, map, toArray, mergeMap } from 'rxjs/operators';
import { PoiSearchOutputType, ExternalPoi, OsmPoiTypes } from './lib/types';
import { FlickrService } from './flickr.service';
import { GooglePoiService } from './google-poi.service';
import { OsmPoiService } from './osm-poi.service';
import { WikipediaPoiService } from './wikipedia-poi.service';
import { YahaApi } from '@yaha/gql-api';

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
  wikipediaPoiService: WikipediaPoiService;
  osmPoiService: OsmPoiService;
  googlePoiService: GooglePoiService;
  flickrService: FlickrService;
}

export const getExternapPois =
  (deps: ExternalPoiServiceDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    allLanguages: string[],
    alreadyProcessedSourceObjectIds: string[],
  ): Observable<PoiSearchOutputType> =>
    forkJoin([
      deps.wikipediaPoiService.getAll(bounds, allLanguages),
      osmPois(deps.osmPoiService)(bounds),
      deps.googlePoiService.get(bounds, alreadyProcessedSourceObjectIds),
      deps.flickrService.get(bounds),
    ]).pipe(
      map(fp.flow(fp.flattenDeep, filterTypesFv)),
      catchError(err => {
        console.error(`Error in external POI fetch: ${err}`);
        return of([]);
      }),
    );

const osmPois =
  (osmPoiService: OsmPoiService) =>
  (bounds: YahaApi.BoundingBox): Observable<PoiSearchOutputType> =>
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
          osmPoiService.get(bounds, osmPoiType).pipe(delay(2000)),
        1,
      ),
      toArray(),
      map(fp.flatten),
    );
