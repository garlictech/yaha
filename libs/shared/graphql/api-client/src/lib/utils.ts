import * as R from 'ramda';
import { EMPTY, Observable, Observer } from 'rxjs';
import { expand, map, reduce, takeLast } from 'rxjs/operators';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
type SubsType<T> = {
  subscribe: (_arg: Observer<T>) => { unsubscribe: () => void };
};

export const fromApolloSubscription = <T>(
  subscription: SubsType<T>,
): Observable<T> => {
  return new Observable<T>(observer => {
    const subs = subscription.subscribe({
      next: (x: T) => observer.next(x),
      error: (error: unknown) => observer.error(error),
      complete: () => observer.complete(),
    });

    return () => subs.unsubscribe();
  });
};

export const getAllPaginatedData = <
  INPUT extends { limit?: number | null },
  OUTPUT,
>(
  op: (
    variables: { query: INPUT },
    options?: Record<string, unknown>,
  ) => Observable<
    | { nextToken?: string | null; items?: Array<OUTPUT> | null }
    | null
    | undefined
  >,
  params: {
    variables: { query: INPUT };
    options?: Record<string, unknown>;
  },
): Observable<{ items: OUTPUT[] }> => {
  const getPage = (nextToken?: string | null) => {
    console.warn('GEtting a page', nextToken);
    return op(
      {
        query: {
          ...params?.variables.query,
          nextToken,
        },
      },
      params?.options,
    );
  };

  return getPage().pipe(
    expand(result => (result?.nextToken ? getPage(result.nextToken) : EMPTY)),
    reduce((acc: OUTPUT[], result) => R.concat(acc)(result?.items ?? []), []),
    takeLast(1),
    map(items => ({ items })),
  );
};
