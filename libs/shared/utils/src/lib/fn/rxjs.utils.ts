import * as E from 'fp-ts/lib/Either';
import * as O from 'fp-ts/lib/Option';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import {
  Observable,
  of,
  OperatorFunction,
  pipe,
  throwError,
  UnaryFunction,
} from 'rxjs';
import { defaultIfEmpty, filter, map, switchMap, tap } from 'rxjs/operators';
import * as fp from 'lodash/fp';

export const pipeDebug = <T>(tag: string) => {
  return tap<T>({
    next(value) {
      console.debug(`[${tag}: Next]`, JSON.stringify(value, undefined, 2));
    },
    error(error) {
      console.debug(`[${tag}: Error]`, JSON.stringify(error, undefined, 2));
    },
    complete() {
      console.debug(`[${tag}]: Complete`);
    },
  });
};

export function filterNullish<T>(): UnaryFunction<
  Observable<T | null | undefined>,
  Observable<T>
> {
  return pipe(
    filter(x => x !== null && x !== undefined) as OperatorFunction<
      T | null | undefined,
      T
    >,
  );
}

export function filterNullishWithDefault<T>(
  defaultValue: T,
): UnaryFunction<Observable<T | null | undefined>, Observable<T>> {
  return pipe(
    filter(x => x !== null && x !== undefined) as OperatorFunction<
      T | null | undefined,
      T
    >,
    defaultIfEmpty(defaultValue),
  );
}

export function filterNullishGraphqlListWithDefault<T>(
  defaultValue: T[],
): UnaryFunction<
  Observable<{ items: T[] | null | undefined; nextToken?: string }>,
  Observable<T[]>
> {
  return pipe(
    filterNullishWithDefault<{ items: T[] | null | undefined }>({
      items: defaultValue,
    }),
    map(listResult => listResult.items),
    filterNullishWithDefault<T[]>(defaultValue),
  );
}

export function filterNullishElements<T>(): UnaryFunction<
  Observable<Array<T | null | undefined> | null | undefined>,
  Observable<T[]>
> {
  return pipe(
    filterNullish(),
    map(fp.filter(fp.negate(fp.isEmpty))) as OperatorFunction<
      Array<T | null | undefined>,
      T[]
    >,
  );
}

export function throwIfEmptyValue<T>(
  message = 'Unexpected empty value',
): UnaryFunction<Observable<T | null | undefined>, Observable<T>> {
  return pipe(
    switchMap(x =>
      fp.isEmpty(x) ? throwError(new Error(message)) : of(x),
    ) as OperatorFunction<T | null | undefined, T>,
  );
}

export const oeTryCatch = <TYPE>(x: Observable<TYPE>) =>
  OE.tryCatch(x) as OE.ObservableEither<string, TYPE>;

export const foldObservableOption = <T>(par: O.Option<T>): Observable<T> =>
  O.fold(
    () => throwError('Invalid data'),
    (x: T) => of(x),
  )(par);

export const foldObservableEither = <T>(
  par: E.Either<unknown, T>,
): Observable<T> =>
  E.fold(
    res => throwError(res),
    (res: T) => of(res),
  )(par);
