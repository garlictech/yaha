import * as sm from '@aws-cdk/aws-secretsmanager';
import { CfnOutput } from '@aws-cdk/core';
import * as sst from '@serverless-stack/resources';
import { App } from '@serverless-stack/resources';

const secretsManagerArns: Record<string, string> = {
  dev: 'arn:aws:secretsmanager:eu-west-1:568276182587:secret:anyupp-dev-secrets-WtbZ0k',
  qa: 'arn:aws:secretsmanager:eu-west-1:568276182587:secret:anyupp-qa-secrets-4cFY1U',
  staging:
    'arn:aws:secretsmanager:eu-west-1:568276182587:secret:anyupp-staging-secrets-4rGQUb',
  prod: 'arn:aws:secretsmanager:eu-west-1:486782650003:secret:anyupp-prod-secrets-OQjuwn',
  appleSigninKey:
    'arn:aws:secretsmanager:eu-west-1:568276182587:secret:apple-signin-private-key-eHFjFn',
  appleSigninKeyProd:
    'arn:aws:secretsmanager:eu-west-1:486782650003:secret:apple-signin-private-key-oejVJN',
};

export class SecretsManagerStack extends sst.Stack {
  public googleClientSecret: string;
  public facebookAppSecret: string;
  public stripeSecretKey: string;
  public stripeSigningSecret: string;
  public szamlazzhuAgentKey: string;
  public appleSigninKey: string;
  public secretsManager: sm.ISecret;

  constructor(scope: sst.App, id: string, props?: sst.StackProps) {
    super(scope, id, props);
    const app = this.node.root as App;

    const secretsManagerArn =
      secretsManagerArns[scope.stage] || secretsManagerArns.dev;

    this.secretsManager = sm.Secret.fromSecretAttributes(
      this,
      'AnyuppSecrets',
      {
        secretArn: secretsManagerArn,
      },
    );

    const appleSigninKeySecret = sm.Secret.fromSecretAttributes(
      this,
      'AppleSigninKey',
      {
        secretArn:
          app.stage === 'prod'
            ? secretsManagerArns.appleSigninKeyProd
            : secretsManagerArns.appleSigninKey,
      },
    );

    const googleClientSecret =
      this.secretsManager.secretValueFromJson('googleClientSecret');
    this.googleClientSecret = googleClientSecret.toString();

    const facebookAppSecret =
      this.secretsManager.secretValueFromJson('facebookAppSecret');
    this.facebookAppSecret = facebookAppSecret.toString();

    //--- get Stripe secret keys
    const stripeSecretKey =
      this.secretsManager.secretValueFromJson('stripeSecretKey');
    this.stripeSecretKey = stripeSecretKey.toString();

    const stripeSigningSecret = this.secretsManager.secretValueFromJson(
      'stripeSigningSecret',
    );
    this.stripeSigningSecret = stripeSigningSecret.toString();

    const szamlazzhuAgentKey =
      this.secretsManager.secretValueFromJson('szamlazzhuAgentKey');
    this.szamlazzhuAgentKey = szamlazzhuAgentKey.toString();

    this.appleSigninKey = appleSigninKeySecret.secretValue.toString();

    new CfnOutput(this, 'SecretsManager', {
      value: this.secretsManager.secretArn,
      exportName: app.logicalPrefixedName('SecretsManager'),
    });
  }
}
