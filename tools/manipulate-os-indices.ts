// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/manipulate-os-indices.ts
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '../libs/gql-api/src';
import { catchError, defer, from, mergeMap, switchMap } from 'rxjs';
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
      ).pipe(
        switchMap(() =>
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
          ),
        ),
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
  )
  .subscribe();
