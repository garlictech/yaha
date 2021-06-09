import * as chatbot from '@aws-cdk/aws-chatbot';
import * as sst from '@serverless-stack/resources';
import * as sns from '@aws-cdk/aws-sns';
import { SecretsManagerStack } from './secretsmanager-stack';

export interface CiStackProps extends sst.StackProps {
  readonly secretsManager: SecretsManagerStack;
}

export class CiStack extends sst.Stack {
  public chatbot: chatbot.SlackChannelConfiguration;

  constructor(app: sst.App, id: string, props: CiStackProps) {
    super(app, id, props);

    /*new codebuild.GitHubSourceCredentials(this, 'CodeBuildGitHubCreds', {
      accessToken: props.secretsManager.githubOauthToken.secretValue,
    });*/

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
