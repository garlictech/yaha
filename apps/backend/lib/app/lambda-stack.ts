import {
  aws_lambda as lambda,
  aws_iam as iam,
  aws_secretsmanager as sm,
  Duration,
} from 'aws-cdk-lib';
import * as sst from '@serverless-stack/resources';
import path from 'path';
import { commonLambdaProps } from './lambda-common';
import { AmplifyApiConfig } from '@yaha/gql-api';

export interface LambdaStackProps extends sst.StackProps {
  secretsManager: sm.ISecret;
  apiAccessKeyId: string;
  apiSecretAccessKey: string;
}

export class LambdaStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: LambdaStackProps) {
    super(scope, id);

    const amplifyApiLambda = new lambda.Function(this, 'AmplifyApiLambda', {
      ...commonLambdaProps,
      // It must be relative to the serverless.yml file
      functionName: `${scope.stage}-yaha-amplify-resolvers`,
      handler: 'index.handler',
      code: lambda.Code.fromAsset(
        path.join(__dirname, '../../build/amplify-resolvers'),
      ),
      timeout: Duration.seconds(30),
      memorySize: 512,
      environment: {
        OPENSEARCH_ENDPOINT: AmplifyApiConfig.openSearchEndpoint,
        API_ACCESS_KEY_ID: props.apiAccessKeyId,
        API_SECRET_ACCESS_KEY: props.apiSecretAccessKey,
      },
    });

    if (amplifyApiLambda.role) {
      amplifyApiLambda.role.addManagedPolicy(
        iam.ManagedPolicy.fromAwsManagedPolicyName('AmazonDynamoDBFullAccess'),
      );
      amplifyApiLambda.role.addManagedPolicy(
        iam.ManagedPolicy.fromAwsManagedPolicyName('AdministratorAccess'),
      );
      amplifyApiLambda.role.addToPrincipalPolicy(
        new iam.PolicyStatement({
          actions: ['es:ESHttpPost'],
          resources: ['*'],
        }),
      );
    }

    props.secretsManager.grantRead(amplifyApiLambda);
  }
}
