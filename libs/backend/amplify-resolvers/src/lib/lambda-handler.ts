//import { getGraphqlSdkForIAM } from '@yaha/gql-api';
import { Context, Handler } from 'aws-lambda';
import { searchByRadiusResolver } from './search-resolvers';
const { createConnector } = require('aws-elasticsearch-js');
import { Client } from '@elastic/elasticsearch';
import { AmplifyApiConfig } from '@yaha/gql-api';

export interface AmplifyRequest {
  typeName: string;
  fieldName: string;
  identity?: {
    username?: string;
  };
  arguments: unknown;
}

//const awsAccesskeyId = process.env.API_ACCESS_KEY_ID || '';
//const awsSecretAccessKey = process.env.API_SECRET_ACCESS_KEY || '';
//const sdk = getGraphqlSdkForIAM(awsAccesskeyId, awsSecretAccessKey);

const searchDeps = {
  osClient: new Client({
    nodes: [AmplifyApiConfig.openSearchEndpoint],
    Connection: createConnector({ region: process.env.AWS_REGION || '' }),
  }),
};

export const handler: Handler<AmplifyRequest, unknown> = (
  event: AmplifyRequest,
  _context: Context,
): Promise<unknown> => {
  console.debug('### Appsync Lambda handler ~ event:AmplifyRequest', event);

  // We don't use typing here, we explicitly check the fields in runtime.
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const resolverMap: any = {
    Mutation: {},
    Query: {
      searchByRadius: searchByRadiusResolver(searchDeps),
    },
  };

  const op = resolverMap[event.typeName]?.[event.fieldName]?.(event.arguments);

  if (op === undefined) {
    return Promise.reject(
      'Unknown graphql field in the appsync-lambda handler',
    );
  } else {
    return op.toPromise();
  }
};
