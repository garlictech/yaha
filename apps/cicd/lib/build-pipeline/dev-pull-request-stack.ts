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

    const generatedLibExcludes =
      '--exclude=shared-config --exclude=yaha-gql-api --exclude=crud-gql-api';

    const project = new codebuild.Project(
      this,
      'Yaha:DEV Verify Pull Request',
      {
        source: githubPrSource,
        buildSpec: codebuild.BuildSpec.fromObject({
          version: '0.2',
          phases: {
            install: {
              commands: [
                'chmod +x ./tools/*.sh',
                `./tools/setup-aws-environment.sh`,
                './tools/install-nodejs-14.sh',
                'yarn --frozen-lockfile',
                'npm install -g @aws-amplify/cli cowsay',
                'git clone https://github.com/flutter/flutter.git -b stable --depth 1 /tmp/flutter',
                'export PATH=$PATH:/tmp/flutter/bin',
                'flutter doctor',
                'npx cowsay "STARTING PR CHECK"',
              ],
            },
            build: {
              commands: [
                //`./tools/build-workspace.sh ${utils.appConfig.name} ${stage}`,
                `yarn nx affected:lint --base=${stage} ${generatedLibExcludes}`,
                `yarn nx affected:test --base=${stage} --exclude="mobile_app" --exclude="integration-tests-universal" ${generatedLibExcludes} --codeCoverage --coverageReporters=clover`,
                `yarn nx test mobile_app`,
                `yarn nx buildApk mobile_app`,
                'npx cowsay "YOUR PR IS SUPERCOOL!!!"',
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
            },
          },
        }),
        environment: {
          buildImage: codebuild.LinuxBuildImage.AMAZON_LINUX_2_3,
          computeType: codebuild.ComputeType.MEDIUM,
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
