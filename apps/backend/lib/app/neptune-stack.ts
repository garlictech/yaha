import { aws_ec2 as ec2, CfnOutput, RemovalPolicy } from 'aws-cdk-lib';
import * as neptune from '@aws-cdk/aws-neptune-alpha';
import * as sst from '@serverless-stack/resources';

export interface NeptuneStackProps extends sst.StackProps {
  vpc: ec2.IVpc;
}

export class NeptuneApiStack extends sst.Stack {
  public writerAddress: string;
  public readerAddress: string;

  constructor(scope: sst.App, id: string, props: NeptuneStackProps) {
    super(scope, id);

    const clusterParams: neptune.DatabaseClusterProps = {
      vpc: props.vpc,
      instanceType: neptune.InstanceType.T3_MEDIUM,
      removalPolicy: scope.stage === 'prod' ? undefined : RemovalPolicy.DESTROY,
    };

    const cluster = new neptune.DatabaseCluster(
      this,
      'Neptune Cluster',
      clusterParams,
    );

    cluster.connections.allowDefaultPortFromAnyIpv4('Open to the world');
    this.writerAddress = cluster.clusterEndpoint.socketAddress;
    this.readerAddress = cluster.clusterReadEndpoint.socketAddress;

    // The next two lines are not required, they just log out the endpoints to your terminal for reference
    new CfnOutput(this, 'readerAddress', {
      value: this.readerAddress,
    });
    new CfnOutput(this, 'writerAddress', {
      value: this.writerAddress,
    });

    // Bastion host to access neptune, only in DEV
    // See: https://faun.pub/create-a-bastion-with-aws-cdk-d5ebfb91aef9
    // Also, accessing is done with the tools/access-neptune-bastion.sh script
    // You have to install the session menager plugin!
    //
    // https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
    if (!['prod', 'staging', 'qa'].includes(scope.stage)) {
      const securityGroupName = 'NeptuneBastionSecurityGroup';

      const sg = new ec2.SecurityGroup(this, 'NeptuneBastionSecurityGroup', {
        securityGroupName,
        description:
          'Security group for the bastion, no inbound open because we should access to the bastion via AWS SSM',
        vpc: props.vpc,
        allowAllOutbound: true,
      });

      const host = new ec2.BastionHostLinux(this, 'NeptuneBastionHost', {
        instanceName: 'NeptuneBastionHost',
        vpc: props.vpc,
        instanceType: new ec2.InstanceType('t2.nano'),
        subnetSelection: {
          subnetType: ec2.SubnetType.PUBLIC,
        },
        securityGroup: sg,
      });

      new CfnOutput(this, 'NeptuneBastionHostID', {
        value: host.instanceId,
      });

      new CfnOutput(this, 'NeptuneBastionHostIP', {
        value: host.instancePublicIp,
      });

      new CfnOutput(this, 'NeptuneBastionHostDNS', {
        value: host.instancePublicDnsName,
      });
    }
  }
}
