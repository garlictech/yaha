import {
  aws_sns as sns,
  aws_codebuild as codebuild,
  aws_chatbot as chatbot,
} from 'aws-cdk-lib';
import * as sst from '@serverless-stack/resources';
import { SecretsManagerStack } from './secretsmanager-stack';

export interface CiStackProps extends sst.StackProps {
  readonly secretsManager: SecretsManagerStack;
}

export class CiStack extends sst.Stack {
  public chatbot: chatbot.SlackChannelConfiguration;

  constructor(app: sst.App, id: string, props: CiStackProps) {
    super(app, id, props);

    new codebuild.GitHubSourceCredentials(this, 'CodeBuildGitHubCreds', {
      accessToken: props.secretsManager.githubOauthToken.secretValue,
    });

    const slackChannelSns = new sns.Topic(this, 'SlackNotificationTopic');

    this.chatbot = new chatbot.SlackChannelConfiguration(
      this,
      'Build Slack notification channel',
      {
        slackChannelId: 'yahabots',
        slackWorkspaceId: 'T0Y1R2084',
        slackChannelConfigurationName: 'YahaBuild',
        notificationTopics: [slackChannelSns],
      },
    );
  }
}
