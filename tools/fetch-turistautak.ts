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

const domParser = new DOMParser();

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || 'AWS_ACCESS_KEY_ID NOT DEFINED',
  process.env.AWS_SECRET_ACCESS_KEY || 'AWS_SECRET_ACCESS_KEY NOT DEFINED',
);

const googleMapsClient = new GoogleMapsClient({});

const hikeIds = [
  113261124, 118158194, 20239810, 22601701, 22605620, 22668771, 22680751,
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
    /*switchMap((hike: YahaApi.CreateHikeInput) =>
      sdk.CreateHike({ input: hike }),
    ),*/
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
  )
  .subscribe(x => console.log(`PROCESSED ${x?.length ?? 0} HIKES.`));
