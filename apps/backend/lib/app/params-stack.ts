import * as ssm from '@aws-cdk/aws-ssm';
import { CfnOutput } from '@aws-cdk/core';
import * as sst from '@serverless-stack/resources';

const rootAppName = 'yaha';

export class ParamsStack extends sst.Stack {
  //public googleClientId: string;
  public facebookAppId: string;
  public googleApiKey: string;
  public appleTeamId: string;
  public appleKeyId: string;
  public appleServiceId: string;
  public neo4jEndpoint: string;

  constructor(scope: sst.App, id: string) {
    super(scope, id);
    const app = this.node.root as sst.App;

    /*this.googleClientId = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'googleClientIdParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/GoogleClientId`,
      },
    ).stringValue;

    new CfnOutput(this, 'googleClientIdOutput', {
      value: this.googleClientId,
      exportName: app.logicalPrefixedName('googleClientId'),
    });
*/
    this.facebookAppId = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'facebookAppIdParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/FacebookAppId`,
      },
    ).stringValue;

    new CfnOutput(this, 'facebookAppIdOutput', {
      value: this.facebookAppId,
      exportName: app.logicalPrefixedName('facebookAppId'),
    });

    this.googleApiKey = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'googleApiKeyParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/GoogleApiKey`,
      },
    ).stringValue;

    new CfnOutput(this, 'googleApiKeyOutput', {
      value: this.googleApiKey,
      exportName: app.logicalPrefixedName('googleApiKey'),
    });

    this.appleTeamId = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'appleTeamIdParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/AppleTeamId`,
      },
    ).stringValue;

    new CfnOutput(this, 'appleTeamIdOutput', {
      value: this.appleTeamId,
      exportName: app.logicalPrefixedName('appleTeamId'),
    });

    this.appleKeyId = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'appleKeyIdParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/AppleKeyId`,
      },
    ).stringValue;

    new CfnOutput(this, 'appleKeyIdOutput', {
      value: this.appleKeyId,
      exportName: app.logicalPrefixedName('appleKeyId'),
    });

    this.appleServiceId = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'appleServiceIdParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/AppleServiceId`,
      },
    ).stringValue;

    new CfnOutput(this, 'appleServiceIdOutput', {
      value: this.appleServiceId,
      exportName: app.logicalPrefixedName('appleServiceId'),
    });

    this.neo4jEndpoint = ssm.StringParameter.fromStringParameterAttributes(
      this,
      'neo4jEndpointParam',
      {
        parameterName: `/${app.stage}-${rootAppName}/Neo4jEndpoint`,
      },
    ).stringValue;

    new CfnOutput(this, 'neo4jEndpointOutput', {
      value: this.neo4jEndpoint,
      exportName: app.logicalPrefixedName('neo4jEndpoint'),
    });
  }
}
