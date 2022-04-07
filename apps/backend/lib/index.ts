import { App, Stack } from '@serverless-stack/resources';
import { CognitoStack } from './app/cognito-stack';
import { ParamsStack } from './app/params-stack';
import { SecretsManagerStack } from './app/secretsmanager-stack';
//import { NeptuneApiStack } from './app/neptune-stack';
import { LambdaStack } from './app/lambda-stack';
import { aws_ec2 as ec2 } from 'aws-cdk-lib';
import { ConfiguratorStack } from './app/configurator-stack';

export class yahaStack extends Stack {
  constructor(scope: App, id: string) {
    super(scope, id);
    const secretsManagerStack = new SecretsManagerStack(
      scope,
      'SecretsManagerStack',
    );

    const vpc = new ec2.Vpc(this, 'yahaNeptuneVPC');
    const paramsStack = new ParamsStack(scope, 'ParamsStack');

    //    const neptuneStack = new NeptuneApiStack(scope, 'neptune', { vpc });

    new LambdaStack(scope, 'LambdaStack', {
      secretsManager: secretsManagerStack.secretsManager,
      //neptuneReaderAddress: neptuneStack.readerAddress,
      //neptuneWriterAddress: neptuneStack.writerAddress,
      neptuneReaderAddress: '',
      neptuneWriterAddress: '',
      vpc,
      apiAccessKeyId: secretsManagerStack.apiAccessKeyId,
      apiSecretAccessKey: secretsManagerStack.apiSecretAccessKey,
    });

    new CognitoStack(scope, 'cognito', {
      adminSiteUrl: 'https://admin.yaha.com',
      googleClientId: paramsStack.googleClientId,
      googleClientSecret: secretsManagerStack.googleClientSecret,
      facebookClientId: paramsStack.facebookAppId,
      facebookClientSecret: secretsManagerStack.facebookAppSecret,
      appleSigninKey: secretsManagerStack.appleSigninKey,
      appleTeamId: paramsStack.appleTeamId,
      appleKeyId: paramsStack.appleKeyId,
      appleServiceId: paramsStack.appleServiceId,
    });

    new ConfiguratorStack(scope, 'configurator');
  }
}

export default function main(app: App): void {
  new yahaStack(app, 'yaha');
}
