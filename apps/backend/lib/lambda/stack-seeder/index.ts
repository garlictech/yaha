import { CloudFormationCustomResourceEvent } from 'aws-lambda';
import { sendResponse } from '../utils/send-response';

export const handler = async (event: CloudFormationCustomResourceEvent) => {
  console.debug('SEEDER handler event:', JSON.stringify(event, null, 2));

  /**
   * See the AWS documentation for more information passed in the request for a custom resource.
   *
   * https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/crpg-ref-requests.html
   */
  const physicalResourceId = event.ResourceProperties.physicalResourceId;

  if (event.RequestType === 'Create' || event.RequestType === 'Update') {
    await sendResponse({
      status: 'SUCCESS',
      requestId: event.RequestId,
      stackId: event.StackId,
      reason: '',
      physicalResourceId,
      logicalResourceId: event.LogicalResourceId,
      responseUrl: event.ResponseURL,
    });
  }
};
