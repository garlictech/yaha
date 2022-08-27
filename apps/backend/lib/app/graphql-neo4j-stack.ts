import { aws_ec2, aws_logs, aws_ecr_assets, aws_ecs } from 'aws-cdk-lib';
import path from 'path';
import * as sst from '@serverless-stack/resources';

import { aws_ecs_patterns } from 'aws-cdk-lib';

export interface GraphqlNeo4jStackProps extends sst.StackProps {
  neo4jUsername: string;
  neo4jPassword: string;
  neo4jEndpoint: string;
  cluster: aws_ecs.ICluster;
  vpc: aws_ec2.IVpc;
}

export class GraphqlNeo4jStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: GraphqlNeo4jStackProps) {
    super(scope, id);
    /*const api = new apigateway.LambdaRestApi(this, 'YahaNeo4jGraphql', {
      handler: neo4jOsmLambda,
      deployOptions: {
        stageName: scope.stage,
      },
      proxy: true,
    });
    new ssm.StringParameter(this, 'Neo4jOsmEndpointParam', {
      allowedPattern: '.*',
      description: 'neo4j endpoint for osm operations',
      parameterName: getFQParamName(scope, 'Neo4jOsmEndpoint'),
      stringValue: api.url,
    });

    new CfnOutput(this, 'Neo4jOsmEndpoint', {
      value: api.url,
    });
*/

    const dockerAsset = new aws_ecr_assets.DockerImageAsset(
      this,
      'Neo4jGraphqlDocker',
      {
        directory: path.join(__dirname, '..', '..', 'docker', 'neo4j-graphql'),
        buildArgs: { platform: 'linux/amd64' },
      },
    );

    const dockerImage =
      aws_ecs.ContainerImage.fromDockerImageAsset(dockerAsset);

    const taskDefinition = new aws_ecs.FargateTaskDefinition(
      this,
      'Neo4jGraphqlTaskdef',
      {
        memoryLimitMiB: 512,
        cpu: 256,
      },
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
      containerPort: 80,
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

    serviceSecGrp.connections.allowFromAnyIpv4(aws_ec2.Port.tcp(80));

    new aws_ecs_patterns.ApplicationLoadBalancedFargateService(
      this,
      'Neo4jGraphqlService',
      {
        cluster: props.cluster, // Required
        circuitBreaker: {
          rollback: true,
        },
        securityGroups: [serviceSecGrp],
        cpu: 256, // Default is 256
        desiredCount: 1, // Default is 1
        memoryLimitMiB: 512, // Default is 512
        publicLoadBalancer: true,
        assignPublicIp: true,
        taskDefinition,
      },
    );
  }
}
