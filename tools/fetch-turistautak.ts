/*import {resolveDataInPolygon} from '@bit/garlictech.universal.shared.graphql-data';
import {PoiApiService, PoiModule} from '../../lib/nestjs/gtrack/poi';
import {CheckpointAdminFp} from '../../lib/universal/gtrack/checkpoints-admin';
import {Route, RouteFp} from '../../lib/universal/gtrack/route';
import {ProcessRouteSegmentModule} from '../../backend/src/lambda/process-route-segment/process-route-segment.module';
import {ProcessRouteSegmentService} from '../../backend/src/lambda/process-route-segment/process-route-segment.service';
import {GtrackDefaults} from '@bit/garlictech.universal.gtrack.defaults/defaults';
import {foldObservableEither} from '@bit/garlictech.universal.shared.fp';
import {getCityFromGoogle} from '@bit/garlictech.nodejs.shared.reverse-geocoding';
*/
import { OGM } from '@neo4j/graphql-ogm';
import lineChunk from '@turf/line-chunk';
import * as xmlParse from 'fast-xml-parser';
import { flow } from 'fp-ts/lib/function';
import fs from 'fs';
import * as fp from 'lodash/fp';
import neo4j from 'neo4j-driver';
import * as rp from 'request-promise';
import { defer, from, Observable, throwError } from 'rxjs';
import {
  filter,
  map,
  mergeMap,
  shareReplay,
  switchMap,
  take,
  tap,
  withLatestFrom,
} from 'rxjs/operators';
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

const getCoordinates = (osmWayId: number): Observable<any> =>
  defer(() => {
    return from(
      driver.session().run(
        `
      MATCH (n:OSMWay)-[:TAGS]->(t:OSMTags)
      WHERE n.way_osm_id = ${osmWayId}
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

const fetchHikeOsmId = defer(() => {
  return from(
    driver.session().run(
      `
MATCH (n:OSMWay)-[:TAGS]->(t:OSMTags)
WHERE t.route = "hiking"
WITH n LIMIT 10
RETURN n
      `,
    ),
  );
}).pipe(
  map(
    flow(
      result => result.records,
      fp.map((record: any) => record._fields[0].properties.way_osm_id.low),
    ),
  ),
  take(1),
  shareReplay(1),
);

const getProperties = (osmWayId: number) =>
  defer(() => {
    return from(
      driver.session().run(
        `
MATCH (n:OSMWay)-[:TAGS]->(t:OSMTags)
WHERE n.way_osm_id = ${osmWayId}
RETURN t
      `,
      ),
    );
  }).pipe(
    map(
      flow(
        result => result.records,
        fp.map((record: any) => record._fields[0].properties),
        fp.first,
        (result: any) => ({
          description: {
            languageKey: 'hu',
            title: result.name,
            summary: result['description:hu'],
            type: 'markdown',
          },
          osmWayId,
        }),
      ),
    ),
    tap(x => console.warn(JSON.stringify(x, null, 2))),
    take(1),
    //  shareReplay(1),
  );

const getName = (osmWayId: number) =>
  getProperties(osmWayId).pipe(
    map(properties => properties.description.title),
    //shareReplay(),
  );

const getGpx = (osmWayId: number) =>
  getCoordinates(osmWayId).pipe(
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
    withLatestFrom(getName(osmWayId)),
    tap(([data, name]) => fs.writeFileSync(`${name.gpx}`, data)),
    map(segmentPoints => segmentPoints[0]),
  );

fetchHikeOsmId
  .pipe(
    switchMap(from),
    mergeMap((osmWayId: number) =>
      getProperties(osmWayId).pipe(
        tap(result =>
          console.log('Hike found:', JSON.stringify(result, null, 2)),
        ),
        switchMap(() => getGpx(osmWayId)),
      ),
    ),
  )
  .subscribe();

//getGpx.subscribe();

/*const createHike = getCoordinates().pipe(
  map(
    coordinates => `

    `,
  ),
);*/
//const schemaFilename = `${__dirname}/../libs/neo4j-gql/backend/graphql/schema/hiking-api.graphql`;

//export const typeDefs = fs.readFileSync(schemaFilename).toString('utf-8');

//const ogm = new OGM({ typeDefs, driver });

//const Hike = ogm.model('Hike');

const hikeIds = [
  113261124,
  //118158194,

  //20239810,
  //22601701,
  //22605620,
  //22668771,
  //22680751,
  //22684373,
  //22690585,
  //22690716,
  //22691299,
  //22695956,
  //22696121,
  //22711259,

  //22711874,
  //22720132,
  //22721173,
  //22721221,
  //22725792,
  //22727140,
  //22727146,
  //22731288,
  //22760729,
  //22829303,
  //22831221,
  //22852839,
  //22860187,
  //22860908,
  //22863023,
  //22864467,
  //22893358,
  //22905416,
  //22906071,
  //22970503,
  //22975238,
  //22979172,
  //22983187,
  //22983332,
  //22983401,
  //22984554,
  //23012848,
  //23014223,
  //23032160,
  //23045437,
  //23083111,
  //23188927,
  //23229986,
  //23249195,
  //23331665,
  //23337814,
  //23382972,
  //23449390,
  //23493855,
  //23497369,
  //23504964,
  //23556636,
  //23622089,
  //23735249,
  //23830629,
  //23849919,
  //23852679,
  //23860891,
  //  23981578,
  //  24096317,
  //  24097652,
  //  24146508,
  //  24167440,
  //  24170201,
  //  24228885,
  //  24247899,
  //  24268232,
  //  24294881,
  //  24314849,
  //  24365740,
  //  24381218,
  //  24383861,
  //  24398324,
  //  24400109,
  //  24486419,
  //  24897222,
  //  25644568,
  //  26280602,
  //  26542370,
  //  26590305,
  //  26590449,
  //  26591640,
  //  26591706,
  //  26591833,
  //  26591887,
  //  26591923,
  //  26592003,
  //  26592095,
  //  26592431,
  //  26592468,
  //  26592508,
  //  26592538,
  //  27324857,
  //  27580547,
  //  27764714,
  //  28037630,
  //  28037825,
  //  28063400,
  //  28064728,
  //  28069841,
  //  28070055,
  //  28070284,
  //  28134042,
  //  28226955,
  //  28227208,
  //  28228216,
  //  28228299,
  //  28228481,
  //  28228699,
  //  28250658,
  //  28251487,
  //  28252484,
  //  28252555,
  //  28254974,
  //  28281154,
  //  28281859,
  //  28282031,
  //  28282985,
  //  28283406,
  //  28283601,
  //  28283692,
  //  28284763,
  //  28988710,
  //  28988914,
  //  29019424,
  //  29019653,
  //  29019747,
  //  29019863,
  //  29182553,
  //  29370158,
  //  29400168,
  //  29400209,
  //  29400263,
  //  29400388,
  //  29624082,
  //  29659596,
  //  29661462,
  //  29807400,
  //  29850248,
  //  29885786,
  //  29918501,
  //  29946430,
  //  30075826,
  //  30181158,
  //  30374842,
  //  30766342,
  //  30816049,
  //  30881357,
  //  31054141,
  //  31121649,
  //  31260496,
  //  31294290,
  //  31324332,
  //  31326674,
  //  31589484,
  //  31730521,
  //  31775909,
  //  31980590,
  //  32058422,
  //  32355281,
  //  32355596,
  //  32434285,
  //  32588683,
  //  32735554,
  //  32912943,
  //  33274766,
  //  33365767,
  //  33755798,
  //  33828096,
  //  34001178,
  //  34109336,
  //  34109389,
  //  34133934,
  //  34137225,
  //  34137231,
  //  34188066,
  //  34315075,
  //  34456162,
  //  34478002,
  //  34478569,
  //  34510130,
  //  34669898,
  //  34695087,
  //  34836828,
  //  35017982,
  //  35018205,
  //  35055017,
  //  35063328,
  //  35096868,
  //  35097310,
  //  35118136,
  //  35321204,
  //  35321339,
  //  35711378,
  //  35848954,
  //  35874986,
  //  35875450,
  //  35875853,
  //  35875973,
  //  36013883,
  //  36013923,
  //  36013954,
  //  36013985,
  //  36014664,
  //  36014686,
  //  36014742,
  //  36014780,
  //  36014791,
  //  36014890,
  //  36014926,
  //  36102625,
  //  36474457,
  //  36702409,
  //  36782362,
  //  36783790,
  //  37066129,
  //  37284495,
  //  37634590,
  //  38749457,
  //  39289108,
  //  39433002,
  //  40853518,
  //  41555465,
  //  42854308,
  //  43079461,
  //  43185464,
  //  43486098,
  //  44115617,
  //  44134453,
  //  44142130,
  //  44197069,
  //  44305978,
];

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
