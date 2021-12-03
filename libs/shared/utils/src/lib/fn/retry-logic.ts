import { Observable, throwError, timer } from 'rxjs';
import { mergeMap, retryWhen } from 'rxjs/operators';

export const buildRetryLogic =
  <T>({
    handleError,
    maxRetryAttempts = 3,
    exponentialBackoffFactor = 1,
    retryScalingDurationInMillisec = 1000,
  }: {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    handleError?: (_error: any) => boolean;
    maxRetryAttempts?: number;
    exponentialBackoffFactor?: number;
    retryScalingDurationInMillisec?: number;
  }) =>
  (source: Observable<T>): Observable<T> =>
    source.pipe(
      retryWhen((attempts: Observable<T>) =>
        attempts.pipe(
          mergeMap((error, i) => {
            const retryAttempt = i + 1;
            // if maximum number of retries have been met
            // or response is a status code we don't wish to retry, throw error
            if (retryAttempt > maxRetryAttempts) {
              console.log(`Max retry attempts reached, giving up`);
              return throwError(error);
            }

            console.log(
              `Attempt ${retryAttempt}: retrying in ${
                retryAttempt * retryScalingDurationInMillisec
              }ms`,
            );

            if (handleError && !handleError(error)) {
              console.error(`Unrecoverable error ${error}, giving up...`);
              return throwError(error);
            }

            // retry after 1s, 2s, etc...
            return timer(
              retryAttempt *
                retryScalingDurationInMillisec *
                Math.pow(exponentialBackoffFactor, i),
            );
          }),
        ),
      ),
    );
