import * as sst from '@serverless-stack/resources';

export const getFQParamNameFromDetails = (
  stage: string,
  appName: string,
  paramName: string,
) => `/${stage}-${appName}/generated/${paramName}`;

export const getFQParamName = (app: sst.App, paramName: string) =>
  getFQParamNameFromDetails(app.stage, app.name, paramName);

export const commonBackendStack = 'common-backend-yaha';
export const yahaVpcName = 'yahaVpc';
export const yahaFargateClusterName = 'yaha-fargate-cluster';
export const yahaVpcSecurityGroupParamName = '/common/yahaVpcSecurityGroupName';
export const yahaVpcIdParamName = '/common/yahaVpcId';

export const getCommonVpcNameDev = () =>
  `dev-${commonBackendStack}/${yahaVpcName}`;

export const getCommonVpcNameProd = () =>
  `prod-${commonBackendStack}/${yahaVpcName}`;
