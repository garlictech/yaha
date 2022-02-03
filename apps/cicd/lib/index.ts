import { App } from '@serverless-stack/resources';
import { DevBuildPipelineStack } from './build-pipeline/dev-pipeline-stack';
import { SecretsManagerStack } from './build-pipeline/secretsmanager-stack';
import { DevPullRequestBuildStack } from './build-pipeline/dev-pull-request-stack';
import { PipelineStackProps } from './build-pipeline/utils';
import { CiStack } from './build-pipeline/ci-stack';
import { AppcenterStack } from './build-pipeline/appcenter-stack';

export default function main(app: App): void {
  const pipelineSecretsManagerArn =
    'arn:aws:secretsmanager:us-east-1:697486207432:secret:cicd-x85ydp';

  const githubSecretsManagerArn =
    'arn:aws:secretsmanager:us-east-1:697486207432:secret:GithubAccessToken-4e4gsy';

  const commonSecrets = {
    pipelineSecretsManagerArn,
    githubSecretsManagerArn,
  };

  const devSecretsManagerStack = new SecretsManagerStack(
    app,
    'devsecretsmanager',
    {
      ...commonSecrets,
      projectSecretsManagerArn:
        'arn:aws:secretsmanager:us-east-1:697486207432:secret:/yaha/dev/secrets-JzPwln',
    },
  );

  /*const qaSecretsManagerStack = new SecretsManagerStack(
    app,
    'qasecretsmanager',
    {
      ...commonSecrets,
      projectSecretsManagerArn:
        'arn:aws:secretsmanager:us-east-1:697486207432:secret:/yaha/qa/secrets-2JtTdF',
    },
  );
*/
  const appcenterStack = new AppcenterStack(app, 'AppcenterStack');

  const ciStack = new CiStack(app, 'CiStack', {
    secretsManager: devSecretsManagerStack,
  });

  const commonConfig = {
    repoOwner: 'garlictech',
    repoName: 'yaha',
    chatbot: ciStack.chatbot,
    appcenterUser: appcenterStack.iamUser,
  };

  const devPullRequestConfig: PipelineStackProps = {
    repoBranch: 'dev',
    secretsManager: devSecretsManagerStack,
    ...commonConfig,
  };

  const devBuildPipelineConfig: PipelineStackProps = {
    repoBranch: 'dev',
    secretsManager: devSecretsManagerStack,
    ...commonConfig,
  };

  new DevBuildPipelineStack(
    app,
    'DevBuildPipelineStack',
    devBuildPipelineConfig,
  );

  const prBuild = new DevPullRequestBuildStack(
    app,
    'DevPullRequestBuildStack',
    devPullRequestConfig,
  );

  prBuild.addDependency(ciStack);

  /*new QABuildPipelineStack(app, 'QABuildStack', {
    repoBranch: 'qa',
    secretsManager: qaSecretsManagerStack,
    ...commonConfig,
  });

  new StagingBuildPipelineStack(app, 'StagingBuildStack', {
    repoBranch: 'staging',
    secretsManager: qaSecretsManagerStack,
    ...commonConfig,
  });*/
}
