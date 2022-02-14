import { aws_secretsmanager as sm, CfnOutput } from 'aws-cdk-lib';
import * as sst from '@serverless-stack/resources';

const secretsManagerArns: Record<string, string> = {
  dev: 'arn:aws:secretsmanager:us-east-1:697486207432:secret:yaha-dev-secrets-VBIyIl',
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
  public neo4jUsername: string;
  public neo4jPassword: string;
  public secretsManager: sm.ISecret;
  public apiAccessKeyId: string;
  public apiSecretAccessKey: string;

  constructor(scope: sst.App, id: string, props?: sst.StackProps) {
    super(scope, id, props);
    const app = this.node.root as sst.App;

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

    const neo4jUsername =
      this.secretsManager.secretValueFromJson('neo4jUsername');
    this.neo4jUsername = neo4jUsername.toString();

    const neo4jPassword =
      this.secretsManager.secretValueFromJson('neo4jPassword');
    this.neo4jPassword = neo4jPassword.toString();

    new CfnOutput(this, 'SecretsManager', {
      value: this.secretsManager.secretArn,
      exportName: app.logicalPrefixedName('SecretsManager'),
    });

    this.apiAccessKeyId = this.secretsManager
      .secretValueFromJson('apiAccessKeyId')
      .toString();

    this.apiSecretAccessKey = this.secretsManager
      .secretValueFromJson('apiSecretAccessKey')
      .toString();
  }
}
