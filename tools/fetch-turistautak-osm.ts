import { OGM } from '@neo4j/graphql-ogm';
import lineChunk from '@turf/line-chunk';
import * as xmlParse from 'fast-xml-parser';
import { flow } from 'fp-ts/lib/function';
import fs from 'fs';
import * as fp from 'lodash/fp';
import neo4j from 'neo4j-driver';
import * as rp from 'request-promise';
import { defer, from, Observable, throwError } from 'rxjs';
import { filter, map, mergeMap, switchMap, tap } from 'rxjs/operators';
import * as DOMParser from 'xmldom';
import { BaseBuilder, buildGPX } from 'gpx-builder';
//
// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/fetch-turistautak.ts
//
/* eslint no-console: "off" */
//import * as E from 'fp-ts/lib/Either';
//import * as togeojson from '@mapbox/togeojson';
const togeojson = require('@mapbox/togeojson');

const driver = neo4j.driver(
  'bolt://192.168.68.129:7687',
  neo4j.auth.basic('neo4j', 'Neo4j'),
);

const session = driver.session();

const Waypoint = BaseBuilder.MODELS.Point;

const remoteDriver = neo4j.driver(
  'bolt://ec2-100-26-215-193.compute-1.amazonaws.com:7687',
  neo4j.auth.basic('neo4j', 'Neo4j'),
);

const remoteSession = remoteDriver.session();

const getCoordinates = (): Observable<any> =>
  defer(() => {
    return from(
      session.run(
        `
      MATCH (n:OSMWay)-[:TAGS]->(t:OSMTags)
      WHERE t.route = "hiking"
      WITH n LIMIT 1
      MATCH (n)-[:FIRST_NODE]->(p1:OSMWayNode)
      MATCH (p1)-[:NEXT *1..]->(p2:OSMWayNode)
      MATCH (p2)-[:NODE]->(p3)
      RETURN p3.lat, p3.lon
      `,
      ),
    );
  }).pipe(
    map(
      flow(
        result => result.records,
        fp.map((record: any) => record._fields),
      ),
    ),
  );

const getGpx = getCoordinates().pipe(
  tap(console.log),
  map(
    flow(
      fp.map((coordinate: any) => {
        return new Waypoint(coordinate[0], coordinate[1], {
          ele: 0,
        });
      }),
      segmentPoints => {
        const gpxData = new BaseBuilder();
        gpxData.setSegmentPoints(segmentPoints);
        return buildGPX(gpxData.toObject());
      },
    ),
  ),
  tap(data => fs.writeFileSync('lofasz.gpx', data)),
  tap(() => console.log('Finished.')),
);

getGpx.subscribe();

/*const createHike = getCoordinates().pipe(
  map(
    coordinates => `

    `,
  ),
);

const hikeIds = [113261124];
*/
// Fetch the hike
// get the coordinates
// create OSM nodes of that, tag with yaha
// create an osm way (tagged with yaha)
// create OSM tag

/*
  const processSegments = (segments: number[][][]) =>
  getRouteProcessor.pipe(
    switchMap(routeProcessor =>
      from(segments).pipe(
        mergeMap(segment => routeProcessor.process(segment), 1)
      )
    )
  );

type Environment = {
  graphqlClient: GraphqlClientService;
  poiApiService: PoiApiService;
  segments: Position[][];
  route: Route;
  searchPolygon: Feature<Polygon>;
  waypoints: NEA.NonEmptyArray<number>;
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
      x => of(x)
    ),
    x => forkJoin([getGraphqlClient, getPoiApi, x]),
    map(([graphqlClient, poiApiService, {routeData, route, waypoints}]) => ({
      graphqlClient,
      poiApiService,
      route,
      segments,
      waypoints,
      searchPolygon: route.bigBuffer,
      routeData,
    }))
  );
*/

/*from(
  rp.get(
    encodeURI(
      `https://regio.outdooractive.com/download.tour.gpx?i=${routeId}&project=oar-hungary&lang=hu`,
    ),
  ),
).pipe(
  map((gpxFile: string) => {
    try {
      const _doc = new DOMParser.DOMParser().parseFromString(
        gpxFile,
        'application/xml',
      );
      const descriptionContent = xmlParse.parse(gpxFile);
      const geojson = togeojson.gpx(_doc);
      const chunks = lineChunk(geojson, segmentDistance, {
        units: 'kilometers',
      });
      return {
        segments: fp.map((x: any) => x.geometry.coordinates, chunks.features),
        title: descriptionContent.gpx.metadata.name,
        description: descriptionContent.gpx.metadata.desc,
      };
    } catch (err) {
      return throwError(err);
    }
  }),
  filter(({segments}: any) => fp.isArray(segments)),
  map(({segments, title, description}: any) => ({
    segments: fp.map((segment: any, index: number) => {
      if (index !== 0) {
        segment[0][2] = segment[1][2];
      }

      if (index !== segments.length - 1) {
        segment[segment.length - 1][2] = segment[segment.length - 2][2];
      }

      return segment;
    }, segments),
    title,
    description,
  })),
  map(({segments, title, description}: any) => ({
    hikeData: {
      description: [
        {
          languageKey: 'hu_HU',
          title: (title || 'a downloaded hike ' + fp.now()).toString(),
          fullDescription: description,
          type: 'html',
        },
      ],
      publicationState: 'published',
    },
    segments,
  })),
  tap(() => console.log('Processing segments...')),
  switchMap(
    ({
      hikeData,
      segments,
    }: {
      hikeData: Partial<HikeData>;
      segments: Position[][];
    }) =>
      processSegments(segments).pipe(
        tap(() => console.log('A segment is processed')),
        toArray(),
        tap((results: any[]) =>
          console.log(`Processed ${results.length} segments`)
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
                  })
                )
              ),
              switchMap(newHike =>
                graphqlClient.backendClient.mutate(CreateHike, {
                  input: newHike,
                })
              ),
              tap(hike => console.log(`Hike created, id: ${hike.id}`))
            )
        ),
        catchError(() => {
          console.log('ERROR AT ROUTE ID ', routeId);
          return of({});
        })
      )
  ),
  tap(() => console.log(`Hike upload result for route ${routeId} is OK`))
);
};

console.log('STARTING...');

from(hikeIds)
.pipe(mergeMap(routeId => fetchRoute(routeId), 1))
.subscribe(
  x => console.log(`FINISHED WITH RESULT ${JSON.stringify(x, null, 2)}`),
  //() => console.log(`ROUTE HANDLING FINISHED`),
  err => console.log(`Errored with result ${JSON.stringify(err, null, 2)}`),
);
*/
