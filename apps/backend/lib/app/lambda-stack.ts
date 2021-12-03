import * as iam from '@aws-cdk/aws-iam';
import * as lambda from '@aws-cdk/aws-lambda';
import * as sm from '@aws-cdk/aws-secretsmanager';
import * as cdk from '@aws-cdk/core';
import * as sst from '@serverless-stack/resources';
import path from 'path';
import { commonLambdaProps } from './lambda-common';
import * as ec2 from '@aws-cdk/aws-ec2';

export interface LambdaStackProps extends sst.StackProps {
  neptuneReaderAddress: string;
  neptuneWriterAddress: string;
  vpc: ec2.Vpc;
  secretsManager: sm.ISecret;
}

export class LambdaStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: LambdaStackProps) {
    super(scope, id);
    // LAMBDA DATA SOURCES
    // Create the lambda first. Mind, that we have to build appsync-lambda.zip
    // with serverless bundle, in the build step! So, you have to declare the lambda
    // in serverless.xml as well (see the example)
    const apiLambda = new lambda.Function(this, 'AppsyncLambda', {
      ...commonLambdaProps,
      // It must be relative to the serverless.yml file
      functionName: `${scope}-yaha-neptune-resolvers`,
      handler: 'lib/lambda/neptune-resolvers/index.handler',
      timeout: cdk.Duration.seconds(30),
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

    if (apiLambda.role) {
      apiLambda.role.addManagedPolicy(
        iam.ManagedPolicy.fromAwsManagedPolicyName('NeptuneFullAccess'),
      );
    }

    props.secretsManager.grantRead(apiLambda);
  }
}
