//
// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/fetch-turistautak.ts
//
/* eslint no-console: "off" */
import axios from 'axios';
import '@aws-amplify/datastore';
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

const hikeIds = [
  //113261124,
  118158194,
  //20239810, 22601701, 22605620, 22668771, 22680751,
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
