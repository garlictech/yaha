const { createConnector } = require('aws-elasticsearch-js');
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig, getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { delay, forkJoin, switchMap, tap } from 'rxjs';
import * as R from 'ramda';
import * as hikeFixtureRaw from './hike-fixture.json';
import {
  searchInEnvelopeResolver,
  SearchResolverDeps,
} from '@yaha/backend/amplify-resolvers';
import { searchHikeByRadiusResolver } from 'libs/backend/amplify-resolvers/src/lib/search-resolvers';

const hikeId = '12-search-hike-in-radius-c86e6484-a2c7-11ec-b909-0242ac120002';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || '',
  process.env.AWS_SECRET_ACCESS_KEY || '',
);

const cleanup$ = forkJoin([sdk.DeleteHike({ input: { id: hikeId } })]);

const hikeFixture: YahaApi.CreateHikeInput = {
  ...hikeFixtureRaw,
  description: [
    {
      ...hikeFixtureRaw.description[0],
      type: YahaApi.TextualDescriptionType.markdown,
    },
  ],
};

afterAll(done => {
  cleanup$.subscribe(() => done());
});

const deps: SearchResolverDeps = {
  osClient: new Client({
    nodes: [AmplifyApiConfig.openSearchEndpoint],
    Connection: createConnector({ region: process.env.AWS_REGION || '' }),
  }),
  sdk,
};

test('Search for a hike in radius', done => {
  sdk
    .CreateHike({ input: hikeFixture })
    .pipe(
      delay(3000),
      switchMap(hike =>
        searchHikeByRadiusResolver(deps)({
          query: {
            location: {
              lon: 19.960138,
              lat: 47.844277,
            },
            radiusInMeters: 1000000,
            limit: 1,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot('SHOULD FIND HIKE'),
      ),
    )
    .subscribe(() => done());
}, 10000);
