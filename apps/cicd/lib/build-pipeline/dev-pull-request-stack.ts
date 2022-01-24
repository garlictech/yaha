import * as utils from './utils';
import * as sst from '@serverless-stack/resources';
import * as codebuild from '@aws-cdk/aws-codebuild';
import { PipelineStackProps } from './utils';

export class DevPullRequestBuildStack extends sst.Stack {
  constructor(app: sst.App, id: string, props: PipelineStackProps) {
    super(app, id, props);

    const stage = 'dev';
    const prefix = utils.projectPrefix(stage);

    const githubPrSource = codebuild.Source.gitHub({
      owner: props.repoOwner,
      repo: props.repoName,
      webhook: true,
      webhookFilters: [
        codebuild.FilterGroup.inEventOf(
          codebuild.EventAction.PULL_REQUEST_CREATED,
        ).andBaseBranchIs(stage),
        codebuild.FilterGroup.inEventOf(
          codebuild.EventAction.PULL_REQUEST_UPDATED,
        ).andBaseBranchIs(stage),
      ],
    });

    const project = new codebuild.Project(
      this,
      'Yaha:DEV Verify Pull Request',
      {
        source: githubPrSource,
        buildSpec: codebuild.BuildSpec.fromObject({
          version: '0.2',
          phases: {
            install: {
              commands: ['apps/cicd/scripts/pr-install.sh'],
              'runtime-versions': {
                nodejs: 14,
              },
            },
            build: {
              commands: [
                `apps/cicd/scripts/pr-build.sh ${utils.appConfig.name} ${stage}`,
              ],
            },
          },
          env: {
            'secrets-manager': {
              AWS_ACCESS_KEY_ID: 'cicd:codebuild-aws_access_key_id',
              AWS_SECRET_ACCESS_KEY: 'cicd:codebuild-aws_secret_access_key',
            },
            variables: {
              NODE_OPTIONS:
                '--unhandled-rejections=strict --max_old_space_size=8196',
              GIT_DISCOVERY_ACROSS_FILESYSTEM: 1,
              AWS_ACCOUNT: app.account,
              CI: 'ci',
            },
            'git-credential-helper': 'yes',
          },
        }),
        environment: {
          buildImage: codebuild.LinuxBuildImage.STANDARD_5_0,
          computeType: codebuild.ComputeType.MEDIUM,
          privileged: true,
        },
      },
    );

    utils.configurePermissions(this, props.secretsManager, [project], prefix);

    utils.configurePRNotifications(
      this,
      project.projectArn,
      props.chatbot,
      stage,
    );
  }
}
