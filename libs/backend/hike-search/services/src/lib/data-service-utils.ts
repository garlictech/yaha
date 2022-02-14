import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import { from, Observable } from 'rxjs';
import { concatMap, mergeMap, toArray } from 'rxjs/operators';
import { pipe } from 'fp-ts/lib/function';
import { throwIfEmptyValue, oeTryCatch } from '@yaha/shared/utils';

export const multipleGet =
  <ITEM>(getOp: ({ id }: { id: string }) => Observable<ITEM>) =>
  (ids: string[]): OE.ObservableEither<string, ITEM[]> =>
    pipe(
      from(ids),
      mergeMap(id => getOp({ id }), 5),
      throwIfEmptyValue(),
      toArray(),
      oeTryCatch,
    );

export const multipleCreate =
  <CREATE, ITEM>(
    createOp: ({ input }: { input: CREATE }) => Observable<ITEM>,
  ) =>
  (items: CREATE[]): OE.ObservableEither<string, ITEM[]> =>
    pipe(
      from(items),
      concatMap(item => createOp({ input: item })),
      throwIfEmptyValue(),
      toArray(),
      oeTryCatch,
    );
