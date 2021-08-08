import path from 'path';
import * as lambda from '@aws-cdk/aws-lambda';
import * as sst from '@serverless-stack/resources';
import { commonLambdaProps } from './lambda-common';
import * as apigateway from '@aws-cdk/aws-apigateway';
import * as ssm from '@aws-cdk/aws-ssm';
import { getFQParamName } from './utils';
import * as cdk from '@aws-cdk/core';

export interface GraphqlNeo4jStackProps extends sst.StackProps {
  neo4jUsername: string;
  neo4jPassword: string;
  neo4jEndpoint: string;
}

export class GraphqlNeo4jStack extends sst.Stack {
  constructor(scope: sst.App, id: string, props: GraphqlNeo4jStackProps) {
    super(scope, id);
    const neo4jOsmLambda = new lambda.Function(
      this,
      'GraphqlNeo4jLambdaStack',
      {
        ...commonLambdaProps,
        timeout: cdk.Duration.seconds(30),
        memorySize: 512,
        handler: 'lib/lambda/graphql-neo4j/index.handler',
        code: lambda.Code.fromAsset(
          path.join(__dirname, '../../.serverless/graphql-neo4j.zip'),
        ),
        environment: {
          NEO4J_USERNAME: props.neo4jUsername,
          NEO4J_PASSWORD: props.neo4jPassword,
          NEO4J_URI: props.neo4jEndpoint,
        },
      },
    );

    const api = new apigateway.LambdaRestApi(this, 'YahaNeo4jGraphql', {
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

    new cdk.CfnOutput(this, 'Neo4jOsmEndpoint', {
      value: api.url,
    });
  }
}
