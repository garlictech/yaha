import { Context, Handler } from 'aws-lambda';
import { Observable } from 'rxjs';
import { getNodeResolver } from './resolver/get-node';
import { createNeptuneDeps } from './resolver/utils';

export interface YahaRequest {
  typeName: string;
  fieldName: string;
  identity?: {
    username?: string;
  };
  arguments: unknown;
}

const neptuneResolverDeps = process.env.NEPTUNE_WRITER
  ? createNeptuneDeps(process.env.NEPTUNE_WRITER || '')
  : // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (undefined as any); // Simply prevents from connecting to neptune in lambda build time

export const neptuneResolverHandler: Handler<YahaRequest, unknown> = (
  event: YahaRequest,
  _context: Context,
): Promise<unknown> => {
  console.debug('### Appsync Lambda handler ~ event:YahaRequest', event);

  // We don't use typing here, we explicitly check the fields in runtime.
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const resolverMap: any = {
    Mutation: {
      upsertHike: getNodeResolver(neptuneResolverDeps),
    },
    Query: {
      getNode: getNodeResolver(neptuneResolverDeps),
    },
  };

  const op = resolverMap[event.typeName]?.[event.fieldName]?.(event.arguments);

  if (op === undefined) {
    return Promise.reject(
      'Unknown graphql field in the appsync-lambda handler',
    );
  } else if (op instanceof Observable) {
    return op.toPromise();
  } else {
    return op;
  }
};
