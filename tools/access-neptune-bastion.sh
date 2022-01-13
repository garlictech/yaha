#!/bin/bash
set -e
IFS='|'

BASTION_NAME=NeptuneBastionHost

export BASTION_INSTANCE_ID=$(aws ec2 describe-instances \
  --region=$AWS_REGION \
  --filter "Name=tag:Name,Values=${BASTION_NAME}" \
  --query "Reservations[].Instances[?State.Name == 'running'].InstanceId[]" \
  --output text)

aws ssm start-session --target $BASTION_INSTANCE_ID \
  --region=$AWS_REGION \
  --document-name AWS-StartPortForwardingSession \
  --parameters '{"portNumber":["8182"],"localPortNumber":["8182"]}'

