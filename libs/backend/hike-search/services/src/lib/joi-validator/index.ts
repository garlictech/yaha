import * as Joi from 'joi';
import * as fp from 'lodash/fp';
import { from, Observable, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

export const validationOptions: Joi.ValidationOptions = {
  abortEarly: false,
};
export interface SchemaValidation<T> {
  validate: (_arg: unknown) => Observable<T>;
  isType: (_arg: unknown) => boolean;
}
export const validateSchema = <REQUIRED_TYPE>(
  schema: Record<string, Joi.Schema>,
  stripUnknown = false,
): SchemaValidation<REQUIRED_TYPE> => {
  return {
    validate: (arg: unknown): Observable<REQUIRED_TYPE> =>
      from(
        Joi.object(schema)
          .options({ stripUnknown })
          .validateAsync(arg, validationOptions),
      ).pipe(
        map(x => x as REQUIRED_TYPE),
        catchError((err: Joi.ValidationError) => {
          return throwError(
            `Object Validation Error (JOI): ` +
              fp.flow(
                fp.map((x: Joi.ValidationErrorItem) => x.message),
                fp.join(', '),
              )(err.details),
          );
        }),
      ),
    isType: (arg: unknown): arg is REQUIRED_TYPE => {
      return !Joi.object(schema).validate(arg).error;
    },
  };
};
