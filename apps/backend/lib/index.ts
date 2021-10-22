import { App, Stack } from '@serverless-stack/resources';
import { CognitoStack } from './app/cognito-stack';
import { GraphqlNeo4jStack } from './app/graphql-neo4j-stack';
import { ParamsStack } from './app/params-stack';
import { SecretsManagerStack } from './app/secretsmanager-stack';
//import { AppsyncAppStack } from './app/appsync-app-stack';
import { SeederStack } from './app/seeder-stack';

export class yahaStack extends Stack {
  constructor(scope: App, id: string) {
    super(scope, id);
    const secretsManagerStack = new SecretsManagerStack(
      scope,
      'SecretsManagerStack',
    );

    const paramsStack = new ParamsStack(scope, 'ParamsStack');

    new CognitoStack(scope, 'cognito', {
      adminSiteUrl: 'https://admin.yaha.com',
      //googleClientId: paramsStack.googleClientId,
      googleClientId:
        '431626171394-q0aom5l91nvapiq4ni1fbcvsaksl2cqh.apps.googleusercontent.com',
      //googleClientSecret: secretsManagerStack.googleClientSecret,
      googleClientSecret: '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',
      facebookClientId: paramsStack.facebookAppId,
      facebookClientSecret: secretsManagerStack.facebookAppSecret,
      appleSigninKey: secretsManagerStack.appleSigninKey,
      appleTeamId: paramsStack.appleTeamId,
      appleKeyId: paramsStack.appleKeyId,
      appleServiceId: paramsStack.appleServiceId,
    });

    if (scope.stage === 'dev' || scope.stage === 'qa') {
      new SeederStack(scope, 'seeder', {
        //adminUserPool: cognitoStack.adminUserPool,
      });
    }

    new GraphqlNeo4jStack(scope, 'neo4j', {
      neo4jEndpoint: paramsStack.neo4jEndpoint,
      neo4jUsername: secretsManagerStack.neo4jUsername,
      neo4jPassword: secretsManagerStack.neo4jPassword,
    });
  }
}

export default function main(app: App): void {
  new yahaStack(app, 'yaha');
}
