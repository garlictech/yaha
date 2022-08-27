import { aws_ecs, aws_ec2 } from 'aws-cdk-lib';
import * as sst from '@serverless-stack/resources';
import { yahaFargateClusterName } from '@yaha/backend/shared/utils';

export interface FargateStackProps extends sst.StackProps {
  vpc: aws_ec2.IVpc;
  securityGroupId: aws_ec2.ISecurityGroup;
}

export class FargateStack extends sst.Stack {
  public cluster: aws_ecs.ICluster;

  constructor(scope: sst.App, id: string, private props: FargateStackProps) {
    super(scope, id);

    this.cluster = aws_ecs.Cluster.fromClusterAttributes(
      this,
      'FargateCluster',
      {
        clusterName: yahaFargateClusterName,
        vpc: this.props.vpc,
        securityGroups: [this.props.securityGroupId],
      },
    );
  }
}
