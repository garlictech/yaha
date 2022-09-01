import {
  aws_ec2,
  aws_certificatemanager as aws_acm,
  aws_route53,
} from 'aws-cdk-lib';
import { App, Stack } from '@serverless-stack/resources';
import { CognitoStack } from './app/cognito-stack';
import { ParamsStack } from './app/params-stack';
import { SecretsManagerStack } from './app/secretsmanager-stack';
import { GraphqlNeo4jStack } from './app/graphql-neo4j-stack';
import { FargateStack } from './app/fargate-stack';

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
      googleClientId: paramsStack.googleClientId,
      googleClientSecret: secretsManagerStack.googleClientSecret,
      facebookClientId: paramsStack.facebookAppId,
      facebookClientSecret: secretsManagerStack.facebookAppSecret,
      appleSigninKey: secretsManagerStack.appleSigninKey,
      appleTeamId: paramsStack.appleTeamId,
      appleKeyId: paramsStack.appleKeyId,
      appleServiceId: paramsStack.appleServiceId,
    });

    const certificateArn =
      'arn:aws:acm:us-east-1:697486207432:certificate/23373fad-50d0-4f6d-a76e-381fe5a6f89a';

    const certificate = aws_acm.Certificate.fromCertificateArn(
      this,
      'AnyuppCertificate',
      certificateArn,
    );

    const zone = aws_route53.HostedZone.fromHostedZoneAttributes(
      this,
      'YahaHostedZone',
      {
        hostedZoneId: 'Z03450602A2PNYLTVGU4F',
        zoneName: 'yaha.app',
      },
    );
    const vpc = aws_ec2.Vpc.fromLookup(this, 'AnyuppVpc', {
      vpcId: paramsStack.vpcId,
    });

    const securityGroupId = aws_ec2.SecurityGroup.fromSecurityGroupId(
      this,
      'YahaDefaultSecurityGroupId',
      paramsStack.securityGroupId,
    );

    const fargate = new FargateStack(scope, 'fargate', {
      vpc,
      securityGroupId,
    });

    new GraphqlNeo4jStack(scope, 'neo4j', {
      neo4jEndpoint: paramsStack.neo4jEndpoint,
      neo4jUsername: secretsManagerStack.neo4jUsername,
      neo4jPassword: secretsManagerStack.neo4jPassword,
      cluster: fargate.cluster,
      vpc,
      certificate,
      zone,
    });
  }
}

export default function main(app: App): void {
  new yahaStack(app, 'yaha');
}
