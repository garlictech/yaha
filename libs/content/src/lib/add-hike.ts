import lineChunk from '@turf/line-chunk';
import { Neo4jdeps } from './utils';
import { from, defer, of, forkJoin, Observable } from 'rxjs';
import {
  map,
  concatMap,
  switchMap,
  tap,
  toArray,
  catchError,
  delay,
  mergeMap,
} from 'rxjs/operators';
import { pipe, flow } from 'fp-ts/lib/function';
import * as R from 'ramda';
import { lineString, LineString, FeatureCollection } from '@turf/helpers';
import { Feature } from '@turf/turf';
import {
  EBuffer,
  RouteSegmentFp,
} from '../../../backend/hike-search/services/src/lib/route-segment';
import { YahaApi } from '../../../gql-api/src';
import {
  ExternalPoi,
  getAllWikipediaPois,
  getGooglePois,
  getOsmPois,
} from '../../../backend/hike-search/services/src/lib/external-poi';
import { isCreatePoiInput } from '../../../backend/hike-search/services/src/lib/joi-schemas/poi-schema';

export interface HikeData {
  externalId: string;
  title: string;
  description?: string;
  summary?: string;
  languageKey: string;
}

const checkCoordinates = (coordinates: number[][]) =>
  R.tap(() =>
    coordinates.forEach((point, index) => {
      if (point.length != 3 || point[2] === undefined || point[2] === null) {
        throw `Found invalid point at index : ${index}`;
      }
    }),
  );

const createWaypoints = (coordinates: number[][]) =>
  pipe(
    coordinates.reduce(
      (prev, point, index) =>
        `${prev}\nmerge (p${index}:Waypoint {latitude: ${point[1]}, longitude: ${point[0]}, height: ${point[2]}})`,
      '',
    ),
  );

const createNextRelations = (coordinates: number[][]) =>
  pipe(
    coordinates.length,
    R.range(1),
    R.reduce(
      (prev, curr) => `${prev}\nmerge (p${curr - 1})-[:NEXT]->(p${curr})`,
      '',
    ),
  );

const createContainsRelations = (coordinates: number[][]) =>
  pipe(
    coordinates.length,
    R.range(0),
    R.reduce((prev, curr) => `${prev},p${curr}`, 'p0'),
    res => `
      with [${res}] as p
      UNWIND range(0,size(p)-1) AS i
      with p[i] as currentNode, i 
      merge (route)-[r:CONTAINS]->(currentNode)
      set r.orderIndex = i  
  `,
  );

const createEndpointRelations = (coordinates: number[][]) =>
  `merge (route)-[:STARTS]->(p0)
   merge (route)-[:ENDS]->(p${coordinates.length - 1})
  `;

const createDescription = (title: string, summary?: string) =>
  `
  merge (hikeDesc:Description {languageKey: "hu_HU", title: "${title}", summary: "${summary}"})
  merge (hikeDesc)-[:EXPLAINS]->(hike)
  `;

const createRouteChunks = (path: FeatureCollection<LineString>) =>
  pipe(
    lineChunk(path, 2, {
      units: 'kilometers',
    }),
    x => x.features,
    R.map(x => x.geometry.coordinates),
  );

export const addRouteToNeo4j =
  (deps: Neo4jdeps) => (hikeData: HikeData) => (coordinates: number[][]) =>
    pipe(
      coordinates,
      checkCoordinates,
      () => `
      merge (route:Route {id: "${hikeData.externalId}"})
      merge (hike:Hike {id: "${hikeData.externalId}"})
      merge (hike)-[:GOES_ON]->(route)
      `,
      res => res + createDescription(hikeData.title, hikeData.summary),
      res =>
        [
          createWaypoints,
          createNextRelations,
          createContainsRelations,
          createEndpointRelations,
        ].reduce((prev, fv) => prev + '\n' + fv(coordinates), res),
      //query => of(query),
      query => defer(() => deps.session.writeTransaction(tx => tx.run(query))),
    );

const getBounds = (segment: Feature<LineString>) => ({
  boundingBox: RouteSegmentFp.calculatePoiSearchBox(segment),
  bigBuffer: RouteSegmentFp.calculateBufferOfLine(EBuffer.BIG)(segment),
  smallBuffer: RouteSegmentFp.calculateBufferOfLine(EBuffer.SMALL)(segment),
});

export enum OsmPoiTypes {
  natural = 'natural',
  amenity = 'amenity',
  publicTransport = 'public_transport',
  emergency = 'emergency',
  historic = 'historic',
  leisure = 'leisure',
  manMade = 'man_made',
  military = 'military',
  shop = 'shop',
  tourism = 'tourism',
}

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
      map(R.flatten),
    );

export const getExternalPois =
  (deps: Neo4jdeps) =>
  (
    bounds: YahaApi.BoundingBox,
    allLanguages: string[],
  ): Observable<ExternalPoi[]> =>
    forkJoin([
      getAllWikipediaPois(deps)(bounds, allLanguages),
      osmPois(getOsmPois(deps))(bounds),
      /* getGooglePois({
        apiKey: deps.googleApiKey,
        http: deps.http,
      })(bounds, []),*/
    ]).pipe(
      map(x =>
        pipe(
          R.flatten(x),
          x => x,
          //filterTypesFv,
          R.tap(res =>
            console.warn('Number of external poi candidates:', res.length),
          ),
          R.filter(x => isCreatePoiInput(x)),
          R.tap(res =>
            console.warn('Number of correct external pois:', res.length),
          ),
        ),
      ),
      catchError(err => {
        console.error(`Error in external POI fetch: ${err}`);
        return of([]);
      }),
    );

const processSegments = (deps: Neo4jdeps) => (segments: number[][][]) =>
  from(segments).pipe(
    map(x => lineString(x)),
    map(getBounds),
    concatMap(state => getExternalPois(deps)(state.boundingBox, ['en', 'hu'])),
    tap(() => console.warn('One segment processed')),
    toArray(),
  );

export const addHike =
  (deps: Neo4jdeps) =>
  ({
    path,
    hikeData,
  }: {
    path: FeatureCollection<LineString>;
    hikeData: HikeData;
  }) =>
    pipe(
      path?.features?.[0]?.geometry.coordinates,
      of,
      //addRouteToNeo4j(deps)(hikeData),
      map(() => createRouteChunks(path)),
      switchMap(processSegments(deps)),
    );
/* 
  match (w:Waypoint) where point.distance(point({latitude: w.latitude, longitude: w.longitude}), point({latitude: 47.858627, longitude: 19.99034})) < 20000
  match (h:Hike)-[:GOES_ON]->(:Route)-[:CONTAINS]->(w)
  return collect(distinct h) limit 25

match (a) -[r] -> () delete a, r;
match (b) delete b;
CREATE CONSTRAINT unique_route IF NOT EXISTS FOR (route:Route) REQUIRE route.externalId IS UNIQUE;
CREATE CONSTRAINT unique_hike IF NOT EXISTS FOR (hike:Hike) REQUIRE hike.externalId IS UNIQUE;


 */
