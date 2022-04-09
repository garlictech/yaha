import { Client } from '@elastic/elasticsearch';
import { defer, from, of } from 'rxjs';
import { catchError, mergeMap } from 'rxjs/operators';
import { AmplifyApiConfig } from '@yaha/gql-api';
import { pipe } from 'fp-ts/lib/function';
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { createConnector } = require('aws-elasticsearch-js');

const client = new Client({
  nodes: [AmplifyApiConfig.openSearchEndpoint],
  Connection: createConnector({ region: process.env.AWS_REGION || '' }),
});

export const createIndices$ = pipe(
  ['poi', 'hike', 'image'],
  from,
  mergeMap(index =>
    defer(() =>
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
      catchError(err => {
        console.warn(
          'The final error during index manipulation (may be OK): ',
          err,
        );
        return of({});
      }),
    ),
  ),
);
