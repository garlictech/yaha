import { LineString } from '@turf/helpers';
import { oeTryCatch } from '@yaha/shared/utils';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import turfBuffer from '@turf/buffer';
import { GraphqlSdk, YahaApi } from '@yaha/gql-api';
import { defer, from, map, Observable, of, throwError } from 'rxjs';
import { Client } from '@elastic/elasticsearch';
import * as R from 'ramda';
import { flow, pipe } from 'fp-ts/lib/function';

export interface SearchResolverDeps {
  osClient: Client;
  sdk: GraphqlSdk;
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
                distance: `${args.query.radiusInMeters / 1000}km`,
                location: args.query.location,
              },
            },
          },
        },
        sort: [
          {
            _geo_distance: {
              location: args.query.location,
              order: 'asc',
              unit: 'km',
              distance_type: 'plane',
            },
            createdAt: 'desc',
          },
        ],
        size: args.query.limit ?? 10,
        track_total_hits: !args.query.nextToken,
      },
      body =>
        args.query.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.query.nextToken),
            }
          : body,
      body => ({
        index: args.query.objectType,
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
                    ...args.query.shape,
                    coordinates: args.query.shape.coordinates,
                  },
                },
              },
            },
          },
        },
        sort: [
          {
            createdAt: 'desc',
          },
        ],
        size: args.query.limit ?? 10,
        track_total_hits: !args.query.nextToken,
      },
      body =>
        args.query.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.query.nextToken),
            }
          : body,
      body => ({
        index: args.query.objectType,
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
                    coordinates: args.query.envelope,
                  },
                },
              },
            },
          },
        },
        sort: [
          {
            createdAt: 'desc',
          },
        ],
        size: args.query.limit ?? 10,
        track_total_hits: !args.query.nextToken,
      },
      body =>
        args.query.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.query.nextToken),
            }
          : body,
      body => ({
        index: args.query.objectType,
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
                    coordinates: args.query.coordinates,
                  },
                },
              },
            },
          },
        },
        sort: [
          {
            createdAt: 'desc',
          },
        ],
        size: args.query.limit ?? 10,
        track_total_hits: !args.query.nextToken,
      },
      body =>
        args.query.nextToken
          ? {
              ...body,
              search_after: JSON.parse(args.query.nextToken),
            }
          : body,
      body => ({
        index: args.query.objectType,
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

export const searchAroundHikeResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchAroundHikeArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      deps.sdk.GetHike({ id: args.query.hikeId }),
      oeTryCatch,
      OE.chain(
        OE.fromPredicate(
          x => !R.isNil(x),
          () => `Hike ${args.query.hikeId} cannot be found`,
        ),
      ),
      OE.map(x => x as YahaApi.Hike),
      OE.map((hike: YahaApi.Hike) =>
        turfBuffer(hike.route as LineString, args.query.distanceInMeters, {
          units: 'meters',
        }),
      ),
      x => x,
      OE.chain(
        flow(
          shape =>
            searchInShapeResolver(deps)({
              query: {
                ...args.query,
                shape: {
                  type: 'Polygon',
                  coordinates: shape.geometry.coordinates,
                },
              },
            }),
          oeTryCatch,
        ),
      ),
      OE.fold(throwError, of),
    );
