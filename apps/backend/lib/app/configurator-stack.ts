import {
  CustomResource,
  aws_lambda as lambda,
  aws_iam as iam,
  custom_resources as cr,
} from 'aws-cdk-lib';
import * as sst from '@serverless-stack/resources';
import { commonLambdaProps } from './lambda-common';
import path from 'path';

export class ConfiguratorStack extends sst.Stack {
  constructor(scope: sst.App, id: string) {
    super(scope, id);
    const app = this.node.root as sst.App;

    const updaterLambda = new lambda.Function(this, 'YahaApiUpdaterLambda', {
      ...commonLambdaProps,
      handler: 'lib/lambda/yaha-api-updater/index.handler',
      code: lambda.Code.fromAsset(
        path.join(__dirname, '../../.serverless/yaha-api-updater.zip'),
      ),
    });

    if (updaterLambda.role) {
      updaterLambda.role.addToPrincipalPolicy(
        new iam.PolicyStatement({
          actions: ['*'],
          resources: ['*'],
        }),
      );
    }

    const provider = new cr.Provider(this, 'YahaApiUpdaterProvider', {
      onEventHandler: updaterLambda,
    });

    new CustomResource(this, 'YahaApiUpdater', {
      serviceToken: provider.serviceToken,
      resourceType: 'Custom::YahaApiUpdater',
      properties: {
        physicalResourceId: app.logicalPrefixedName('YahaApiUpdater'),
      },
    });
  }
}
