#!/bin/bash
set -e
IFS='|'

STAGE=$1
PLATFORM=$2

branch=$STAGE

if [ $STAGE = 'dev'  ] && [ $PLATFORM = 'ios' ]; then
  appId="yaha-ios-dev"
else
  echo "Unsupported app: ${STAGE}/${PLATFORM}"
  exit 1
fi

echo "Trigger app build in stage ${STAGE}, platform ${PLATFORM}"
appcenter build queue -b ${branch} -a "garlictech/${appId}" --token $APP_CENTER_TOKEN

