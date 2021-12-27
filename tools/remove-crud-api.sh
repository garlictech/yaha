#!/bin/bash
set -e
IFS='|'

export AWS_PAGER=""

APPNAME=$1
STAGE=$2

amplify delete --force
aws ssm delete-parameter --name "/${STAGE}-${APPNAME}/generated/AmplifyAppId"
aws ssm delete-parameter --name "/${STAGE}-${APPNAME}/generated/CrudApiGraphqlEndpoint"
aws ssm delete-parameter --name "/${STAGE}-${APPNAME}/generated/CrudApiGraphqlAplKey"

