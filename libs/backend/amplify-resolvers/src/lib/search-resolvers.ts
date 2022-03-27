import { YahaApi } from '@yaha/gql-api';
import { defer, from, map, Observable } from 'rxjs';
import { Client } from '@elastic/elasticsearch';
import * as R from 'ramda';
import { pipe } from 'fp-ts/lib/function';

export interface SearchResolverDeps {
  osClient: Client;
}

export const searchByRadiusResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchByRadiusArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      {
        query: {
          bool: {
            must: {
              match_all: {},
            },
            filter: {
              geo_distance: {
                distance: `${args.input.radiusInMeters / 1000}km`,
                location: args.input.location,
              },
            },
          },
        },
        sort: [
          {
            _geo_distance: {
              location: args.input.location,
              order: 'asc',
              unit: 'km',
              distance_type: 'plane',
            },
            createdAt: 'desc',
          },
        ],
        size: args.input.limit ?? 10,
        track_total_hits: !args.input.nextToken,
      },
      body =>
        args.input.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.input.nextToken),
            }
          : body,
      body => ({
        index: args.input.objectType,
        body,
      }),
      x => defer(() => from(deps.osClient.search(x))),
      map(res =>
        pipe(
          res.body.hits?.hits ?? [],
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          R.map((hit: any) => hit?._source?.id as string),
          R.reject(x => R.isNil(x)),
          items => ({
            items,
            total: res.body.hits.total?.value,
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            nextToken: (R.last(res.body.hits.hits) as any)?.sort
              ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                JSON.stringify((R.last(res.body.hits.hits) as any).sort)
              : undefined,
          }),
        ),
      ),
    );

export const searchInShapeResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchInShapeArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      {
        query: {
          bool: {
            must: {
              match_all: {},
            },
            filter: {
              geo_shape: {
                location: {
                  shape: {
                    ...args.input.shape,
                    coordinates: args.input.shape.coordinates,
                  },
                },
              },
            },
          },
        },
        size: args.input.limit ?? 10,
        track_total_hits: !args.input.nextToken,
      },
      body =>
        args.input.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.input.nextToken),
            }
          : body,
      body => ({
        index: args.input.objectType,
        body,
      }),
      x => defer(() => from(deps.osClient.search(x))),
      map(res =>
        pipe(
          res.body.hits?.hits ?? [],
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          R.map((hit: any) => hit?._source?.id as string),
          R.reject(x => R.isNil(x)),
          items => ({
            items,
            total: res.body.hits.total?.value,
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            nextToken: (R.last(res.body.hits.hits) as any)?.sort
              ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                JSON.stringify((R.last(res.body.hits.hits) as any).sort)
              : undefined,
          }),
        ),
      ),
    );

export const searchInEnvelopeResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchInEnvelopeArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      {
        query: {
          bool: {
            must: {
              match_all: {},
            },
            filter: {
              geo_shape: {
                location: {
                  shape: {
                    type: 'envelope',
                    coordinates: args.input.envelope,
                  },
                },
              },
            },
          },
        },
        size: args.input.limit ?? 10,
        track_total_hits: !args.input.nextToken,
      },
      body =>
        args.input.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.input.nextToken),
            }
          : body,
      body => ({
        index: args.input.objectType,
        body,
      }),
      x => defer(() => from(deps.osClient.search(x))),
      map(res =>
        pipe(
          res.body.hits?.hits ?? [],
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          R.map((hit: any) => hit?._source?.id as string),
          R.reject(x => R.isNil(x)),
          items => ({
            items,
            total: res.body.hits.total?.value,
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            nextToken: (R.last(res.body.hits.hits) as any)?.sort
              ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                JSON.stringify((R.last(res.body.hits.hits) as any).sort)
              : undefined,
          }),
        ),
      ),
    );

export const searchInMultipolygonResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchInMultipolygonArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      {
        query: {
          bool: {
            must: {
              match_all: {},
            },
            filter: {
              geo_shape: {
                location: {
                  shape: {
                    type: 'multipolygon',
                    coordinates: args.input.coordinates,
                  },
                },
              },
            },
          },
        },
        size: args.input.limit ?? 10,
        track_total_hits: !args.input.nextToken,
      },
      body =>
        args.input.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.input.nextToken),
            }
          : body,
      body => ({
        index: args.input.objectType,
        body,
      }),
      x => defer(() => from(deps.osClient.search(x))),
      map(res =>
        pipe(
          res.body.hits?.hits ?? [],
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          R.map((hit: any) => hit?._source?.id as string),
          R.reject(x => R.isNil(x)),
          items => ({
            items,
            total: res.body.hits.total?.value,
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            nextToken: (R.last(res.body.hits.hits) as any)?.sort
              ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                JSON.stringify((R.last(res.body.hits.hits) as any).sort)
              : undefined,
          }),
        ),
      ),
    );
