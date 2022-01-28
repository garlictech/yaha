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

export interface LambdaStackProps extends sst.StackProps {
  neptuneReaderAddress: string;
  neptuneWriterAddress: string;
  vpc: ec2.IVpc;
  secretsManager: sm.ISecret;
}

export class LambdaStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: LambdaStackProps) {
    super(scope, id);
    const apiLambda = new lambda.Function(this, 'AppsyncLambda', {
      ...commonLambdaProps,
      // It must be relative to the serverless.yml file
      functionName: `${scope.stage}-yaha-neptune-resolvers`,
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

    if (apiLambda.role) {
      apiLambda.role.addManagedPolicy(
        iam.ManagedPolicy.fromAwsManagedPolicyName('NeptuneFullAccess'),
      );
    }

    props.secretsManager.grantRead(apiLambda);
  }
}
