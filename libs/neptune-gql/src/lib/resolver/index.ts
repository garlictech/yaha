import * as E from 'fp-ts/lib/Either';
import { buildRetryLogic } from '@bgap/shared/utils';
import { defer, from, throwError, Observable } from 'rxjs';
import { tap, map } from 'rxjs/operators';
import * as CrudApi from '@bgap/crud-gql/api';
import * as R from 'ramda';
import { pipe } from 'fp-ts/lib/function';
import * as gremlin from 'gremlin';
import { handleProcessingError, NeptuneResolverDeps } from './utils';

const __ = gremlin.process.statics;
const c = gremlin.process.column;

export const getNodeResolver =
  (deps: NeptuneResolverDeps) =>
  (args: CrudApi.QueryGetNodeArgs): ReturnType<CrudApi.CrudSdk['GetNode']> => {
    return defer(() =>
      deps.connection.g
        ? from(deps.connection.g.V(args.input.id).elementMap().next())
        : throwError('not connected to neptune'),
    ).pipe(
      buildRetryLogic({
        handleError: handleProcessingError,
      }),
      map(({ value }) =>
        value
          ? {
              ...value,
              __typename: value.label,
            }
          : null,
      ),
    );
  };

export const upsertBusinessEntityResolver =
  (deps: NeptuneResolverDeps) =>
  (args: CrudApi.MutationUpsertBusinessEntityArgs): Observable<unknown> =>
    pipe(
      E.fromNullable('No connection')(deps.connection?.g),
      E.map(g =>
        pipe(
          args.input,
          R.omit(['id', 'label']),
          objectProps =>
            defer(() =>
              (args.input.id
                ? g.V(args.input.id)
                : g.addV(CrudApi.ValidDataLabels.businessentitydata)
              )
                /*
              .fold()
                .coalesce(
                  __.unfold(),
                  __.addV(CrudApi.ValidDataLabels.businessentitydata).property(
                    'id',
                    args.input.id,
                  ),
                )
                .as('entity')
                .inject(objectProps)
                .unfold()
                .as('props')
                .select('entity')
                .property(
                  __.select('props').by(c.keys),
                  __.select('props').by(c.values),
                )
                */
                .next(),
            ),
          buildRetryLogic({
            handleError: handleProcessingError,
          }),
          tap(x => console.log('****', x)),
          map(({ value }) => ({
            ...value,
            __typename: value.label,
          })),
        ),
      ),
      R.tap(x => console.log('**** FINISHED', x)),
      E.fold(throwError, (t: Observable<unknown>) => t),
      R.tap(x => console.log('**** FINISHED', x)),
    );
