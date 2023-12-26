import { HttpClientImpl } from '../../libs/backend/hike-search/services/src/lib/http';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';
import neo4j from 'neo4j-driver';
import { concatMap, from, of, switchMap, tap, toArray } from 'rxjs';
import * as fs from 'fs';
import * as path from 'path';
import { processHikeFromGpx } from '../../libs/content/src';

export const turistautakIds = [
  /* 113261124,
  118158194, 20239810, 22601701, 22605620, 22668771, 22680751 
  22684373, 22690585, 22690716,
  22691299, 22695956, 22696121, 
  22711259,
  22711874, 22720132, 22721173, 22721221, 22725792,
  22727140, 22727146, 
  22731288, 22760729, 22829303, 22831221, 22852839, 22860187, 22860908,
  22863023, 22864467, 22893358, 22905416, */
  22906071 /*22970503, 22975238, 22979172, 22983187, 22983332, 22983401,
  22984554, 23012848, 23014223, 23032160, 23045437, 23083111, 23188927,
  23229986, 23249195, 23331665, 23337814, 23382972, 23449390, 23493855,
  23497369, 23504964, 23556636, 23622089,*/,
].map(x => x.toString());

if (!process.env.PROJECT_ROOT) {
  console.error('PROJECT_ROOT env variable is not set.');
  process.exit(1);
}

export const priveteIds = ['0000001'];

const neo4jUsername = process.env.NEO4J_USERNAME || '';
const neo4jPassword = process.env.NEO4J_PASSWORD || '';
const neo4jUri = process.env.NEO4J_URI || '';

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

export const neo4jDeps = {
  googleApiKey: process.env.GOOGLE_API_KEY || '',
  flickrApiKey: process.env.FLICKR_API_KEY || '',
  http: new HttpClientImpl(),
  googleMapsClient: new GoogleMapsClient({}),
  driver,
  // session,
  projectRoot: process.env.PROJECT_ROOT || '',
};

const fetchRoute = (gpxCollectionFolder: string) => (routeId: string) => {
  console.log(`Processing route id ${routeId}`);
  return of(
    fs
      .readFileSync(
        path.join(
          neo4jDeps.projectRoot,
          'tools',
          'saved_gpxes',
          gpxCollectionFolder,
          `${routeId}.gpx`,
        ),
      )
      .toString(),
  ).pipe(
    switchMap(gpx =>
      processHikeFromGpx(neo4jDeps)(gpx, `turistautak:${routeId}`),
    ),
  );
};

export const processHikes = (gpxCollectionFolder: string, routeIds: string[]) =>
  of(1).pipe(
    switchMap(() => from(routeIds)),
    concatMap(routeId => fetchRoute(gpxCollectionFolder)(routeId)),
    toArray(),
    tap(x => {
      console.log(`PROCESSED ${x?.length ?? 0} HIKES.`);
      neo4jDeps.driver.close();
    }),
  );
