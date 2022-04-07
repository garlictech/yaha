import { getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { tap } from 'rxjs';
const { createConnector } = require('aws-elasticsearch-js');
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '@yaha/gql-api';
import { searchAroundHikeResolver } from '@yaha/backend/amplify-resolvers';

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

test('Search for a hike in radius', done => {
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
