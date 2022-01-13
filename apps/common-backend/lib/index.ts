import * as cdk from '@aws-cdk/core';
import { App, Stack } from '@serverless-stack/resources';
import * as ec2 from '@aws-cdk/aws-ec2';
import * as ssm from '@aws-cdk/aws-ssm';
import {
  yahaVpcName,
  yahaVpcSecurityGroupParamName,
  yahaVpcIdParamName,
} from '@yaha/backend/shared/utils';

export class YahaCommonStack extends Stack {
  constructor(scope: App, id: string) {
    super(scope, id);

    const vpc = new ec2.Vpc(this, yahaVpcName);

    new ssm.StringParameter(this, 'YahaVpcIdParam', {
      allowedPattern: '.*',
      description: 'VPC for the yaha projects',
      parameterName: yahaVpcIdParamName,
      stringValue: vpc.vpcId,
    });

    new ssm.StringParameter(this, 'YahaVpcSecurityGroupNameParam', {
      allowedPattern: '.*',
      description: 'Default security group for the yaha projects',
      parameterName: yahaVpcSecurityGroupParamName,
      stringValue: vpc.vpcDefaultSecurityGroup,
    });

    new cdk.CfnOutput(this, 'YahaVpcSecurityGroupOutput', {
      value: vpc.vpcDefaultSecurityGroup,
    });

    new cdk.CfnOutput(this, 'YahaVpcSubnetOutput', {
      value: vpc.privateSubnets[0].subnetId,
    });

    new cdk.CfnOutput(this, 'YahaVpcIdOutput', {
      value: vpc.vpcId,
    });
  }
}

export default function main(app: App): void {
  new YahaCommonStack(app, 'yaha');
}
