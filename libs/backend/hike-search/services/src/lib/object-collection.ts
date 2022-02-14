import * as A from 'fp-ts/lib/Array';
import { Reader } from 'fp-ts/lib/Reader';
import * as fp from 'lodash/fp';
import { forkJoin, from, Observable, of } from 'rxjs';
import { map, mergeMap, toArray } from 'rxjs/operators';
import { DataServiceActions, QueryData } from './types';
import * as E from 'fp-ts/lib/Either';
import { pipe, flow } from 'fp-ts/lib/function';

export type QueryExecutor<OUTPUT> = (
  queryParams: QueryData,
) => Observable<E.Either<any, OUTPUT[]>>;

export type Update<OUTPUT> = Partial<OUTPUT> & { id: string };
export type Create<OUTPUT> = Omit<OUTPUT, 'id'>;

export type Updater<DATA> = (
  data: Update<DATA>,
) => Observable<E.Either<any, DATA>>;

type QueryExecutorReader<OUTPUT> = Reader<
  QueryExecutor<OUTPUT>,
  Observable<E.Either<any, OUTPUT[]>>
>;

export const createMultipleItems = <
  INPUT,
  OUTPUT extends ({ id: string } | undefined)[],
>(
  input: INPUT[],
): QueryExecutorReader<OUTPUT> =>
  executeChunkedOperation<INPUT, OUTPUT>('createMultipleItems', 50)(input);

export const updateMultipleItems =
  <DATA extends { id: string }[]>(itemsToUpdate: Update<DATA>[]) =>
  (updater: Updater<DATA>): Observable<E.Either<any, DATA[]>> =>
    pipe(
      from(itemsToUpdate),
      mergeMap(updater, 5),
      toArray(),
      map(A.array.sequence(E.either)),
    );

export const upsertMultipleItems =
  <
    INPUT extends { id?: string },
    OUTPUT extends ({ id: string } | undefined)[],
  >(
    input: INPUT[],
  ) =>
  (deps: {
    updater: Updater<INPUT>;
    queryExecutor: QueryExecutor<INPUT>;
  }): Observable<E.Either<any, INPUT[]>> =>
    pipe(
      input,
      fp.partition(item => !!item.id),
      x => x,
      ([toUpdate, toCreate]) =>
        forkJoin([
          createMultipleItems<INPUT, OUTPUT>(toCreate)(deps.queryExecutor),
          updateMultipleItems<INPUT>(toUpdate)(deps.updater),
        ]),
      map(flow(A.array.sequence(E.either), E.map(fp.flatten))),
    );

export const resolveByMultipleKeys =
  <DATA>(keys: string[]) =>
  (queryExecutor: QueryExecutor<DATA>): Observable<E.Either<any, DATA[]>> =>
    executeChunkedOperation(
      'resolveByMultipleKeys',
      100,
    )(keys)(queryExecutor).pipe(map(E.map(fp.remove(fp.isNil))));

export const executeChunkedOperation =
  <INPUT, OUTPUT>(action: DataServiceActions, chunkSize: number) =>
  (data: INPUT[]): QueryExecutorReader<OUTPUT> =>
  queryExecutor => {
    const chunkQueries = pipe(
      data,
      fp.uniq,
      fp.chunk(chunkSize),
      fp.map((dataChunk: INPUT[]) =>
        queryExecutor({
          action,
          stringifiedData: JSON.stringify(dataChunk),
        }),
      ),
      forkJoin,
      map(
        fp.flow(A.array.sequence(E.either), E.map<any, OUTPUT[]>(fp.flatten)),
      ),
    );

    return fp.isEmpty(data) ? of(E.right([])) : chunkQueries;
  };
