import * as sm from '@aws-cdk/aws-secretsmanager';
import { CfnOutput } from '@aws-cdk/core';
import * as sst from '@serverless-stack/resources';
import { App } from '@serverless-stack/resources';

const secretsManagerArns: Record<string, string> = {
  dev: 'arn:aws:secretsmanager:us-east-1:697486207432:secret:/yaha/dev/secrets',
  qa: 'arn:aws:secretsmanager:us-east-1:697486207432:secret:/yaha/qa/secrets',
  staging:
    'arn:aws:secretsmanager:us-east-1:697486207432:secret:/yaha/qa/secrets',
  prod: 'arn:aws:secretsmanager:us-east-1:697486207432:secret:/yaha/qa/secrets',
  appleSigninKey:
    'arn:aws:secretsmanager:us-east-1:697486207432:secret:apple-signin-private-key',
  appleSigninKeyProd:
    'arn:aws:secretsmanager:us-east-1:697486207432:secret:apple-signin-private-key',
};

export class SecretsManagerStack extends sst.Stack {
  public googleClientSecret: string;
  public facebookAppSecret: string;
  public appleSigninKey: string;
  public secretsManager: sm.ISecret;

  constructor(scope: sst.App, id: string, props?: sst.StackProps) {
    super(scope, id, props);
    const app = this.node.root as App;

    const secretsManagerArn =
      secretsManagerArns[scope.stage] || secretsManagerArns.dev;

    this.secretsManager = sm.Secret.fromSecretAttributes(this, 'yahaSecrets', {
      secretPartialArn: secretsManagerArn,
    });

    const appleSigninKeySecret = sm.Secret.fromSecretAttributes(
      this,
      'AppleSigninKey',
      {
        secretPartialArn:
          app.stage === 'prod'
            ? secretsManagerArns.appleSigninKeyProd
            : secretsManagerArns.appleSigninKey,
      },
    );

    this.appleSigninKey = appleSigninKeySecret.secretValue.toString();
    const googleClientSecret =
      this.secretsManager.secretValueFromJson('googleClientSecret');
    this.googleClientSecret = googleClientSecret.toString();

    const facebookAppSecret =
      this.secretsManager.secretValueFromJson('facebookAppSecret');
    this.facebookAppSecret = facebookAppSecret.toString();

    new CfnOutput(this, 'SecretsManager', {
      value: this.secretsManager.secretArn,
      exportName: app.logicalPrefixedName('SecretsManager'),
    });
  }
}
