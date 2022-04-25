import { getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { tap } from 'rxjs';
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { createConnector } = require('aws-elasticsearch-js');
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '@yaha/gql-api';
import { searchSafeImagesAroundLocationResolver } from '@yaha/backend/amplify-resolvers';

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

test('Search safe images around location by resolver', done => {
  searchSafeImagesAroundLocationResolver(searchDeps)({
    query: {
      location: { lat: 47.868717, lon: 19.9801297 },
      radiusInMeters: 50.0,
      objectType: YahaApi.GeoSearchableObjectType.image,
    },
  })
    .pipe(tap(console.warn))
    .subscribe(() => done());
}, 10000);

test.only('Search safe images around location by api', done => {
  sdk
    .SearchSafeImagesAroundLocation({
      query: {
        location: { lat: 47.868717, lon: 19.9801297 },
        radiusInMeters: 50.0,
        objectType: YahaApi.GeoSearchableObjectType.image,
      },
    })
    .pipe(tap(console.warn))
    .subscribe(() => done());
}, 10000);
