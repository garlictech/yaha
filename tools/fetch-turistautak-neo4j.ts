//
// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/fetch-turistautak-neo4j.ts
//
/* eslint no-console: "off" */
import axios from 'axios';
import { defer, from, of } from 'rxjs';
import { concatMap, map, switchMap, tap, toArray } from 'rxjs/operators';
import { DOMParser } from 'xmldom';
const togeojson = require('@mapbox/togeojson');
import { HttpClientImpl } from '../libs/backend/hike-search/services/src/lib/http';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';
import neo4j from 'neo4j-driver';
import { addHike } from '../libs/content/src';

const domParser = new DOMParser();

const neo4jUsername = process.env.NEO4J_USERNAME || '';
const neo4jPassword = process.env.NEO4J_PASSWORD || '';
const neo4jUri = process.env.NEO4J_URI || '';

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

const session = driver.session({ database: 'neo4j' });

const hikeIds: number[] = [
  /*113261124, 118158194, 20239810, 22601701, 22605620, 22668771, */
  //22680751,
  //22684373, 22690585, 22690716,
  //22691299,
  22695956, 22696121, 22711259, 22711874, 22720132, 22721173, 22721221,
  22725792, 22727140, 22727146, 22731288, 22760729, 22829303, 22831221,
  22852839, 22860187, 22860908, 22863023, 22864467, 22893358, 22905416,
  22906071, 22970503, 22975238, 22979172, 22983187, 22983332, 22983401,
  22984554, 23012848, 23014223, 23032160, 23045437, 23083111, 23188927,
  23229986, 23249195, 23331665, 23337814, 23382972, 23449390, 23493855,
  23497369, 23504964, 23556636, 23622089,
];

const deps = {
  googleApiKey: process.env.GOOGLE_API_KEY || '',
  flickrApiKey: process.env.FLICKR_API_KEY || '',
  http: new HttpClientImpl(),
  googleMapsClient: new GoogleMapsClient({}),
  driver,
  session,
};

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
    switchMap(path =>
      addHike(deps)({
        path,
        hikeData: {
          externalId: `turistautak:${routeId}`,
          languageKey: 'hu_HU',
          title: path?.features?.[0]?.properties?.name,
          summary: path?.features?.[0]?.properties?.desc,
        },
      }),
    ),
    toArray(),
    tap(res =>
      console.log(
        `Hike upload result for route ${routeId} is OK, with ${res.length} segments.`,
      ),
    ),
  );
};
console.log('STARTING...');

of(1)
  .pipe(
    switchMap(() => from(hikeIds)),
    concatMap(routeId => fetchRoute(routeId)),
    toArray(),
  )
  .subscribe(x => {
    console.log(`PROCESSED ${x?.length ?? 0} HIKES.`);
    session.close();
  });
