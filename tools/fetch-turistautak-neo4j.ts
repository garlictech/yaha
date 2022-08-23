//
// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/fetch-turistautak.ts
//
/* eslint no-console: "off" */
import axios from 'axios';
import '@aws-amplify/datastore';
import { defer, from, of } from 'rxjs';
import { concatMap, map, delay, switchMap, tap, toArray } from 'rxjs/operators';
import { DOMParser } from 'xmldom';
const togeojson = require('@mapbox/togeojson');
import * as r from 'ramda';
import { YahaApi, getGraphqlSdkForIAM } from '../libs/gql-api/src';
import { pipe } from 'fp-ts/lib/function';
import lineChunk from '@turf/line-chunk';
import * as fp from 'lodash/fp';
import { HttpClientImpl } from '../libs/backend/hike-search/services/src/lib/http';
import {
  processRouteSegment,
  ProcessRouteSegmentDeps,
} from '../libs/backend/hike-search/services/src';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';
import { exit } from 'process';
import { writeFileSync } from 'fs';
import neo4j from 'neo4j-driver';
import { addRouteToNeo4j } from '../libs/content/src';

const domParser = new DOMParser();

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || 'AWS_ACCESS_KEY_ID NOT DEFINED',
  process.env.AWS_SECRET_ACCESS_KEY || 'AWS_SECRET_ACCESS_KEY NOT DEFINED',
);

const googleMapsClient = new GoogleMapsClient({});

const neo4jUsername = process.env.NEO4J_USERNAME || '';
const neo4jPassword = process.env.NEO4J_PASSWORD || '';
const neo4jUri = process.env.NEO4J_URI || '';

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

const session = driver.session({ database: 'neo4j' });

const hikeIds = [
  113261124,
  //118158194, 20239810, 22601701, 22605620, 22668771, 22680751,
];

const deps: ProcessRouteSegmentDeps = {
  googleApiKey: process.env.GOOGLE_API_KEY || '',
  flickrApiKey: process.env.FLICKR_API_KEY || '',
  http: new HttpClientImpl(),
  sdk,
  googleMapsClient: new GoogleMapsClient({}),
};

const processSegments = (segments: number[][][]) =>
  from(segments).pipe(
    concatMap(segment => processRouteSegment(deps)(segment)),
    tap(() => console.warn('One segment processed')),
    toArray(),
  );
/*
type Environment = {
  segments: Position[][];
  route: Route;
  searchPolygon: Feature<Polygon>;
  routeData: RouteData;
};
const getEnvironment = (segments: Position[][]): Observable<Environment> =>
  pipe(
    segments,
    RouteFp.fromRouteSegmentCoordinates(GtrackDefaults.averageSpeed()),
    route => ({
      route,
      waypoints: RouteFp.waypointsFromRouteSegmentCoordinates(segments),
      routeData: O.chain(RouteFp.toRouteData)(route),
    }),
    sequenceS(O.option),
    O.fold(
      () => throwError('Cannot process segment coordinates'),
      x => of(x),
    ),
    x => forkJoin([getGraphqlClient, getPoiApi, x]),
    map(([graphqlClient, poiApiService, { routeData, route, waypoints }]) => ({
      graphqlClient,
      poiApiService,
      route,
      segments,
      waypoints,
      searchPolygon: route.bigBuffer,
      routeData,
    })),
  );

*/

const state: any = {};

const fetchRoute = (routeId: number) => {
  console.log(`Processing route id ${routeId}`);
  return defer(() =>
    from(
      axios.get(
        encodeURI(
          `https://regio.outdooractive.com/download.tour.gpx?i=${routeId}&project=oar-hungary&lang=hu`,
        ),
      ),
    ),
  ).pipe(
    map(response => response.data),
    map((gpxFile: string) => {
      const _doc = domParser.parseFromString(gpxFile, 'application/xml');
      const geojson = togeojson.gpx(_doc);
      state.geojson = geojson;
      return geojson;
    }),
    switchMap(geojson =>
      addRouteToNeo4j({ driver, session })(
        geojson?.features?.[0]?.geometry.coordinates,
        {
          externalId: `turistautak:${routeId}`,
          languageKey: 'hu_HU',
          title: geojson?.features?.[0]?.properties?.name,
          summary: geojson?.features?.[0]?.properties?.desc,
        },
      ),
    ),
    tap(res => console.warn(res)),
    /*  map(geojson => {
      return {
        route: geojson?.features?.[0]?.geometry,
        description: [
          {
            languageKey: 'hu_HU',
            title: geojson?.features?.[0]?.properties?.name,
            summary: geojson?.features?.[0]?.properties?.desc,
            type: YahaApi.TextualDescriptionType.markdown,
          },
        ],
      };
    }),
    switchMap((hike: YahaApi.CreateHikeInput) =>
      sdk.CreateHike({ input: hike }),
    ),
    map(() =>
      pipe(
        lineChunk(state.geojson, 2, {
          units: 'kilometers',
        }),
        x => x.features,
        fp.map((x: any) => x.geometry.coordinates),
        fp.filter(fp.isArray),
      ),
    ),
    switchMap(processSegments),
    */
    /*    switchMap(
      ({
        hikeData,
        segments,
      }: {
        hikeData: Partial<Hike>;
        segments: Position[][];
      }) =>
        processSegments(segments).pipe(
          tap(() => console.log('A segment is processed')),
          toArray(),
          tap((results: any[]) =>
            console.log(`Processed ${results.length} segments`),
          ),
          delay(10000),
          switchMap(() => getEnvironment(segments)),
          switchMap(
            ({
              graphqlClient,
              poiApiService,
              route,
              searchPolygon,
              waypoints,
              routeData,
            }) =>
              forkJoin([
                getCityFromGoogle(route.startPoint),
                resolveDataInPolygon<Poi>({
                  searchPolygon,
                  placeType: PlaceType.poi,
                })({
                  graphqlClient: graphqlClient.backendClient,
                  queryExecutor: poiApiService.api.getWithQuery,
                }),
              ]).pipe(
                map(([location, pois]) => ({ location, pois })),
                map(sequenceS(E.either)),
                switchMap(foldObservableEither),
                map(({ location, pois }) =>
                  pipe(
                    CheckpointAdminFp.getCheckpoints(route, pois),
                    checkpoints => ({
                      ...hikeData,
                      checkpoints,
                      location,
                      segments: waypoints,
                      route: routeData,
                    }),
                  ),
                ),
                switchMap(newHike =>
                  graphqlClient.backendClient.mutate(CreateHike, {
                    input: newHike,
                  }),
                ),
                tap(hike => console.log(`Hike created, id: ${hike.id}`)),
              ),
          ),
          catchError(() => {
            console.log('ERROR AT ROUTE ID ', routeId);
            return of({});
          }),
        ),
    ),*/
    tap(() => console.log(`Hike upload result for route ${routeId} is OK`)),
  );
};
console.log('STARTING...');

of(1)
  .pipe(
    delay(3000),
    switchMap(() => from(hikeIds)),
    concatMap(routeId => fetchRoute(routeId)),
    toArray(),
    tap(() => session.close()),
  )
  .subscribe(x => console.log(`PROCESSED ${x?.length ?? 0} HIKES.`));
