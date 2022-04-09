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

const executeQuery =
  (deps: SearchResolverDeps) =>
  (
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    body: Record<string, any>,
    nextToken: string | undefined | null,
    objectType: YahaApi.GeoSearchableObjectType,
  ) =>
    pipe(
      nextToken
        ? {
            ...body,
            search_after: JSON.parse(nextToken),
          }
        : body,
      body => ({
        index: objectType,
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

export const getBufferAroundHike =
  (deps: SearchResolverDeps) => (hikeId: string, distanceInMeters: number) =>
    pipe(
      deps.sdk.GetHike({ id: hikeId }),
      oeTryCatch,
      OE.chain(
        OE.fromPredicate(
          x => !R.isNil(x),
          () => `Hike ${hikeId} cannot be found`,
        ),
      ),
      OE.map(x => x as YahaApi.Hike),
      OE.map((hike: YahaApi.Hike) =>
        turfBuffer(hike.route as LineString, distanceInMeters, {
          units: 'meters',
        }),
      ),
    );

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
        executeQuery(deps)(body, args.query.nextToken, args.query.objectType),
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
        executeQuery(deps)(body, args.query.nextToken, args.query.objectType),
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
        executeQuery(deps)(body, args.query.nextToken, args.query.objectType),
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
        executeQuery(deps)(body, args.query.nextToken, args.query.objectType),
    );

export const searchAroundHikeResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchAroundHikeArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      getBufferAroundHike(deps)(args.query.hikeId, args.query.distanceInMeters),
      OE.chain(
        flow(
          shape =>
            searchInMultipolygonResolver(deps)({
              query: {
                ...args.query,
                coordinates: [shape.geometry.coordinates],
              },
            }),
          oeTryCatch,
        ),
      ),
      OE.fold(throwError, of),
    );

export const searchSafeImagesAroundHikeResolver =
  (deps: SearchResolverDeps) =>
  (
    args: YahaApi.QuerySearchSafeImagesAroundHikeArgs,
  ): Observable<YahaApi.GeoSearchConnection> =>
    pipe(
      getBufferAroundHike(deps)(args.query.hikeId, args.query.distanceInMeters),
      OE.map(shape => ({
        query: {
          bool: {
            must: [{ match: { banned: false } }],
            filter: {
              geo_shape: {
                location: {
                  shape: {
                    type: 'multipolygon',
                    coordinates: [shape.geometry.coordinates],
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
      })),

      OE.map(body =>
        executeQuery(deps)(
          body,
          args.query.nextToken,
          YahaApi.GeoSearchableObjectType.image,
        ),
      ),
      OE.fold(throwError, R.identity),
    );
