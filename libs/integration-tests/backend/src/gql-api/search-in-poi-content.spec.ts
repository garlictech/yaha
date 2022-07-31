const { createConnector } = require('aws-elasticsearch-js');
import { AmplifyApiConfig, getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { delay, forkJoin, switchMap, tap } from 'rxjs';
import * as R from 'ramda';
import { TextualDescriptionType } from 'libs/gql-api/src/lib/generated/yaha-api';
import { SearchResolverDeps } from '@yaha/backend/amplify-resolvers';
import { Client } from '@elastic/elasticsearch';
import { searchByContentResolver } from 'libs/backend/amplify-resolvers/src/lib/search-resolvers';

const poiId = '12-search-poi-in-radius-c86e6484-a2c7-11ec-b909-0242ac120002';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || '',
  process.env.AWS_SECRET_ACCESS_KEY || '',
);

const cleanup$ = forkJoin([sdk.DeletePoi({ input: { id: poiId } })]);

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

test('Search for a poi in radius', done => {
  sdk
    .CreatePoi({
      input: {
        id: poiId,
        location: {
          lat: 1,
          lon: 1,
        },
        description: [
          {
            languageKey: 'en_US',
            type: TextualDescriptionType.markdown,
            title: 'foobar',
          },
          {
            languageKey: 'hu_HU',
            type: TextualDescriptionType.markdown,
            title: 'THIS IS A FOOBAR',
          },
        ],
      },
    })
    .pipe(
      delay(3000),
      switchMap(() =>
        searchByContentResolver(deps)({
          query: {
            content: 'FOOBA',
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot('SHOULD FIND poi'),
      ),
      switchMap(res =>
        searchByContentResolver(deps)({
          query: {
            content: 'FOOBA',
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
            nextToken: res.nextToken,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD NOT FIND POI',
        ),
      ),
    )
    .subscribe(() => done());
}, 10000);
