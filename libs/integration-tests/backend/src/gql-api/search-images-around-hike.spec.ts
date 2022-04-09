import { getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { tap } from 'rxjs';
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { createConnector } = require('aws-elasticsearch-js');
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '@yaha/gql-api';
import {
  searchAroundHikeResolver,
  searchSafeImagesAroundHikeResolver,
} from '@yaha/backend/amplify-resolvers';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || '',
  process.env.AWS_SECRET_ACCESS_KEY || '',
);

const searchDeps = {
  osClient: new Client({
    nodes: [AmplifyApiConfig.openSearchEndpoint],
    Connection: createConnector({ region: process.env.AWS_REGION || '' }),
  }),
  sdk,
};

test('Search images around hike', done => {
  searchAroundHikeResolver(searchDeps)({
    query: {
      hikeId: 'd23e03ce-6f10-47ad-b6f4-37a1ec628f3e',
      distanceInMeters: 0.1,
      objectType: YahaApi.GeoSearchableObjectType.image,
    },
  })
    .pipe(tap(console.warn))
    .subscribe(() => done());
}, 10000);

test('Search safe images around hike', done => {
  searchSafeImagesAroundHikeResolver(searchDeps)({
    query: {
      hikeId: 'd23e03ce-6f10-47ad-b6f4-37a1ec628f3e',
      distanceInMeters: 100,
    },
  })
    .pipe(tap(console.warn))
    .subscribe(() => done());
}, 10000);
