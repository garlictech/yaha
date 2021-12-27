import * as neptune from '@aws-cdk/aws-neptune';
import * as sst from '@serverless-stack/resources';
import * as ec2 from '@aws-cdk/aws-ec2';
import * as cdk from '@aws-cdk/core';
import * as iam from '@aws-cdk/aws-iam';
import * as lambda from '@aws-cdk/aws-lambda';
import { commonLambdaProps } from './lambda-common';
import path from 'path';

export interface NeptuneStackProps extends sst.StackProps {
  vpc: ec2.Vpc;
}

export class NeptuneApiStack extends sst.Stack {
  public writerAddress: string;
  public readerAddress: string;

  constructor(scope: sst.App, id: string, props: NeptuneStackProps) {
    super(scope, id);

    const cluster = new neptune.DatabaseCluster(this, 'Neptune Cluster', {
      vpc: props.vpc,
      instanceType: neptune.InstanceType.R5_LARGE,
    });

    cluster.connections.allowDefaultPortFromAnyIpv4('Open to the world');

    this.writerAddress = cluster.clusterEndpoint.socketAddress;
    this.readerAddress = cluster.clusterReadEndpoint.socketAddress;

    const resolverLambda = new lambda.Function(this, 'YahaNeptuneResolvers', {
      ...commonLambdaProps,
      functionName: `${scope.stage}-neptune-resolvers`,
      timeout: cdk.Duration.seconds(30),
      memorySize: 512,
      handler: 'lib/lambda/neptune-resolvers/index.handler',
      code: lambda.Code.fromAsset(
        path.join(__dirname, '../../.serverless/neptune-resolvers.zip'),
      ),
      environment: {
        NEPTUNE_READER: this.readerAddress,
        NEPTUNE_WRITER: this.writerAddress,
      },
    });

    if (resolverLambda.role) {
      resolverLambda.role.addManagedPolicy(
        iam.ManagedPolicy.fromAwsManagedPolicyName('NeptuneFullAccess'),
      );
    }

    // The next two lines are not required, they just log out the endpoints to your terminal for reference
    new cdk.CfnOutput(this, 'readerAddress', {
      value: this.readerAddress,
    });
    new cdk.CfnOutput(this, 'writerAddress', {
      value: this.writerAddress,
    });
  }
}
