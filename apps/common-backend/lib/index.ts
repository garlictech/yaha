import { aws_ec2 as ec2, aws_ssm as ssm, CfnOutput } from 'aws-cdk-lib';
import { App, Stack } from '@serverless-stack/resources';
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

    new CfnOutput(this, 'YahaVpcSecurityGroupOutput', {
      value: vpc.vpcDefaultSecurityGroup,
    });

    new CfnOutput(this, 'YahaVpcSubnetOutput', {
      value: vpc.privateSubnets[0].subnetId,
    });

    new CfnOutput(this, 'YahaVpcIdOutput', {
      value: vpc.vpcId,
    });
  }
}

export default function main(app: App): void {
  new YahaCommonStack(app, 'yaha');
}
