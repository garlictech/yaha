import {
  aws_lambda as lambda,
  aws_iam as iam,
  aws_secretsmanager as sm,
  aws_ec2 as ec2,
  Duration,
} from 'aws-cdk-lib';
import * as sst from '@serverless-stack/resources';
import path from 'path';
import { commonLambdaProps } from './lambda-common';
import { AmplifyApiConfig } from '@yaha/gql-api';

export interface LambdaStackProps extends sst.StackProps {
  neptuneReaderAddress: string;
  neptuneWriterAddress: string;
  vpc: ec2.IVpc;
  secretsManager: sm.ISecret;
  apiAccessKeyId: string;
  apiSecretAccessKey: string;
}

export class LambdaStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: LambdaStackProps) {
    super(scope, id);
    const neptuneApiLambda = new lambda.Function(this, 'NeptuneApiLambda', {
      ...commonLambdaProps,
      // It must be relative to the serverless.yml file
      functionName: `${scope.stage}-yaha-neptune2-resolvers`,
      handler: 'lib/lambda/neptune-resolvers/index.handler',
      timeout: Duration.seconds(30),
      memorySize: 1024,
      code: lambda.Code.fromAsset(
        path.join(__dirname, '../../.serverless/neptune-resolvers.zip'),
      ),
      environment: {
        NEPTUNE_READER: props.neptuneReaderAddress,
        NEPTUNE_WRITER: props.neptuneWriterAddress,
      },
      vpc: props.vpc,
    });

    if (neptuneApiLambda.role) {
      neptuneApiLambda.role.addManagedPolicy(
        iam.ManagedPolicy.fromAwsManagedPolicyName('NeptuneFullAccess'),
      );
    }

    props.secretsManager.grantRead(neptuneApiLambda);

    const amplifyApiLambda = new lambda.Function(this, 'AmplifyApiLambda', {
      ...commonLambdaProps,
      // It must be relative to the serverless.yml file
      functionName: `${scope.stage}-yaha-amplify-resolvers`,
      handler: 'lib/lambda/amplify-resolvers/index.handler',
      timeout: Duration.seconds(30),
      memorySize: 512,
      code: lambda.Code.fromAsset(
        path.join(__dirname, '../../.serverless/amplify-resolvers.zip'),
      ),
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
