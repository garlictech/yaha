// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/manipulate-os-indices.ts
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '../libs/gql-api/src';
import { catchError, defer, from, mergeMap } from 'rxjs';
const { createConnector } = require('aws-elasticsearch-js');
const client = new Client({
  nodes: [AmplifyApiConfig.openSearchEndpoint],
  Connection: createConnector({ region: process.env.AWS_REGION || '' }),
});

/*defer(() =>
  from(
    client.indices.create({
      index: 'hike',
      body: {
        mappings: {
          properties: {
            location: {
              type: 'geo_point',
            },
          },
        },
      },
    }),
  ),
)
  .pipe(
    catchError(() =>
      defer(() =>
        from(
          client.indices.putMapping({
            index: 'poi',
            body: {
              properties: {
                location: {
                  type: 'geo_point',
                },
              },
            },
          }),
        ),
      ),
    ),
  )
  .subscribe();
 */

from(['poi', 'hike', 'image'])
  .pipe(
    mergeMap(index =>
      from(
        client.indices.delete({
          index,
        }),
      ),
    ),
  )
  .subscribe();
