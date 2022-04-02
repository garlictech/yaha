import { YahaApi } from '@yaha/gql-api';
const { createConnector } = require('aws-elasticsearch-js');
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '@yaha/gql-api';
import { searchInShapeResolver } from '@yaha/backend/amplify-resolvers';
import { switchMap, tap } from 'rxjs';

const searchDeps = {
  osClient: new Client({
    nodes: [AmplifyApiConfig.openSearchEndpoint],
    Connection: createConnector({ region: process.env.AWS_REGION || '' }),
  }),
};
test('Search for a poi in radius', done => {
  searchInShapeResolver(searchDeps)({
    query: {
      shape: {
        type: 'polygon',
        coordinates: [
          [
            [18, 46],
            [20, 46],
            [20, 48],
            [18, 48],
            [18, 46],
          ],
        ],
      },
      objectType: YahaApi.GeoSearchableObjectType.poi,
      limit: 100,
    },
  })
    .pipe(
      tap(x => console.warn(x)),
      switchMap(res =>
        searchInShapeResolver(searchDeps)({
          query: {
            shape: {
              type: 'polygon',
              coordinates: [
                [
                  [18, 46],
                  [20, 46],
                  [20, 48],
                  [18, 48],
                  [18, 46],
                ],
              ],
            },
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 10,
            nextToken: res.nextToken,
          },
        }),
      ),

      tap(x => console.warn(x)),
    )
    .subscribe(() => done());
}, 10000);
