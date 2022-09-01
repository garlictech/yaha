// ############
// execute with:
// yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/tag-untagged-images.ts
import neo4j from 'neo4j-driver';
import { HttpClientImpl } from '../libs/backend/hike-search/services/src/lib/http';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';
import { tagUntaggedImages } from '../libs/content/src';

const neo4jUsername = process.env.NEO4J_USERNAME || '';
const neo4jPassword = process.env.NEO4J_PASSWORD || '';
const neo4jUri = process.env.NEO4J_URI || '';

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

const session = driver.session({ database: 'neo4j' });

const deps = {
  googleApiKey: process.env.GOOGLE_API_KEY || '',
  flickrApiKey: process.env.FLICKR_API_KEY || '',
  http: new HttpClientImpl(),
  googleMapsClient: new GoogleMapsClient({}),
  driver,
  session,
};

tagUntaggedImages(deps).subscribe(x => {
  console.log(`FINITO 👯‍♀️`);
  session.close();
});
