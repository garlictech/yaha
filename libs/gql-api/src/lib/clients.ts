import {
  GraphqlApiClient,
  GraphqlApiFp,
} from '@yaha/shared/graphql/api-client';
import { GraphqlSdk, getSdkAmplify } from './sdk';
import awsmobile from './generated/aws-exports';
import { pipe } from 'fp-ts/function';

const createSdk = (gqlClient: GraphqlApiClient) =>
  getSdkAmplify(gqlClient._client) as unknown as GraphqlSdk;

export const getGraphqlSdkForIAM = (
  awsAccesskeyId: string,
  awsSecretAccessKey: string,
) =>
  pipe(
    GraphqlApiFp.createBackendClient(
      awsmobile,
      awsAccesskeyId,
      awsSecretAccessKey,
    ),
    createSdk,
  );

export const getGraphqlSdkForUserPool = () =>
  pipe(GraphqlApiFp.createAuthenticatedClient(awsmobile, true), createSdk);

export const getGraphqlSdkPublic = () =>
  pipe(GraphqlApiFp.createPublicClient(awsmobile, true), createSdk);
