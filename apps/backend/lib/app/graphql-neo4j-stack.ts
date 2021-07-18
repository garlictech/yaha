import path from 'path';
import * as lambda from '@aws-cdk/aws-lambda';
import * as sst from '@serverless-stack/resources';
import { commonLambdaProps } from './lambda-common';

export type GraphqlNeo4jStackProps = sst.StackProps;

export class GraphqlNeo4jStack extends sst.Stack {
  constructor(scope: sst.App, id: string, _props: GraphqlNeo4jStackProps) {
    super(scope, id);
    const neo4jGraphglLambda = new lambda.Function(
      this,
      'GraphqlNeo4jLambdaStack',
      {
        ...commonLambdaProps,
        handler: 'lib/lambda/neo4j-graphgl/index.handler',
        code: lambda.Code.fromAsset(
          path.join(__dirname, '../../.serverless/graphql-neo4j.zip'),
        ),
      },
    );
  }
}
