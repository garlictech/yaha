import { from, Observable } from 'rxjs';
import { concatMap, mergeMap, toArray } from 'rxjs/operators';
import { pipe } from 'fp-ts/lib/function';

export const multipleGet =
  <ITEM>(getOp: ({ id }: { id: string }) => Observable<ITEM>) =>
  (ids: string[]): Observable<ITEM[]> =>
    pipe(
      from(ids),
      mergeMap(id => getOp({ id }), 5),
      toArray(),
    );

export const multipleWrite =
  <CREATE, ITEM>(
    createOp: ({
      input,
    }: {
      input: CREATE;
    }) => Observable<ITEM | undefined | null>,
  ) =>
  (items: CREATE[]): Observable<Array<ITEM | undefined | null>> =>
    pipe(
      from(items),
      concatMap(item => createOp({ input: item })),
      toArray(),
    );
