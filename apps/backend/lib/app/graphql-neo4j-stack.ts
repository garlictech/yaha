import {
  aws_ec2,
  aws_route53,
  aws_certificatemanager as aws_acm,
  aws_logs,
  aws_ecr_assets,
  aws_ecs,
  aws_elasticloadbalancingv2,
} from 'aws-cdk-lib';
import path from 'path';
import * as sst from '@serverless-stack/resources';

import { aws_ecs_patterns } from 'aws-cdk-lib';

export interface GraphqlNeo4jStackProps extends sst.StackProps {
  neo4jUsername: string;
  neo4jPassword: string;
  neo4jEndpoint: string;
  cluster: aws_ecs.ICluster;
  vpc: aws_ec2.IVpc;
  certificate: aws_acm.ICertificate;
  zone: aws_route53.IHostedZone;
}

export class GraphqlNeo4jStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: GraphqlNeo4jStackProps) {
    super(scope, id);
    const dockerAsset = new aws_ecr_assets.DockerImageAsset(
      this,
      'Neo4jGraphqlDocker',
      {
        directory: path.join(__dirname, '..', '..', 'docker', 'neo4j-graphql'),
        //buildArgs: { platform: 'linux/amd64' },
      },
    );

    const dockerImage =
      aws_ecs.ContainerImage.fromDockerImageAsset(dockerAsset);

    const taskDefinition = new aws_ecs.FargateTaskDefinition(
      this,
      'Neo4jGraphqlTaskdef',
      {},
    );

    const container = taskDefinition.addContainer('DefaultContainer', {
      image: dockerImage,
      environment: {
        NEO4J_URI: props.neo4jEndpoint,
        NEO4J_USERNAME: props.neo4jUsername,
        NEO4J_PASSWORD: props.neo4jPassword,
      },
      logging: aws_ecs.LogDriver.awsLogs({
        streamPrefix: `yaha-neo4j-graphql-${scope.stage}`,
        logGroup: new aws_logs.LogGroup(this, 'LogGroup', {
          retention: 7,
        }),
      }),
    });

    container.addPortMappings({
      containerPort: 4000,
    });

    const serviceSecGrp = new aws_ec2.SecurityGroup(
      this,
      'Neo4jGraphqlServiceSecurityGroup',
      {
        allowAllOutbound: true,
        securityGroupName: 'neo4jGraphqlServiceSecurityGroup',
        vpc: props.vpc,
      },
    );

    serviceSecGrp.connections.allowFromAnyIpv4(aws_ec2.Port.tcp(4000));

    const service = new aws_ecs_patterns.ApplicationLoadBalancedFargateService(
      this,
      'Neo4jGraphqlService',
      {
        cluster: props.cluster, // Required
        circuitBreaker: {
          rollback: true,
        },
        securityGroups: [serviceSecGrp],
        cpu: 512, // Default is 256
        desiredCount: 1, // Default is 1
        memoryLimitMiB: 1024, // Default is 512
        publicLoadBalancer: true,
        assignPublicIp: true,
        taskDefinition,
        protocol: aws_elasticloadbalancingv2.ApplicationProtocol.HTTPS,
        domainName: `${scope.stage}.api.yaha.app`,
        domainZone: props.zone,
      },
    );

    service.service.autoScaleTaskCount({
      minCapacity: 1,
      maxCapacity: 2,
    });

    service.targetGroup.configureHealthCheck({
      path: '/.well-known/apollo/server-health',
    });
  }
}
