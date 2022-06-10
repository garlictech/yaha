// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/manipulate-os-indices.ts
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '../libs/gql-api/src';
import { toArray, catchError, defer, from, mergeMap, switchMap } from 'rxjs';
const { createConnector } = require('aws-elasticsearch-js');
const client = new Client({
  nodes: [AmplifyApiConfig.openSearchEndpoint],
  Connection: createConnector({ region: process.env.AWS_REGION || '' }),
});

from(['poi', 'hike', 'image'])
  .pipe(
    mergeMap(index =>
      from(
        client.indices.delete({
          index,
        }),
      ),
    ),
    switchMap(() => from(['poi', 'image'])),
    mergeMap(index =>
      from(
        client.indices.create({
          index,
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
      ).pipe(
        catchError(() =>
          defer(() =>
            from(
              client.indices.putMapping({
                index,
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
      ),
    ),
    toArray(),
    switchMap(() => from(['hike'])),
    mergeMap(index =>
      from(
        client.indices.create({
          index,
          body: {
            mappings: {
              properties: {
                route: {
                  type: 'geo_shape',
                },
              },
            },
          },
        }),
      ).pipe(
        catchError(() =>
          defer(() =>
            from(
              client.indices.putMapping({
                index,
                body: {
                  properties: {
                    route: {
                      type: 'geo_shape',
                    },
                  },
                },
              }),
            ),
          ),
        ),
      ),
    ),
  )
  .subscribe();
