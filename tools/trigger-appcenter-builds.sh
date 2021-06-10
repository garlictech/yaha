#!/bin/bash
set -e
IFS='|'

STAGE=$1
PLATFORM=$2

appId="yaha-$PLATFORM-$STAGE"

echo "Trigger app build in stage ${STAGE}, platform ${PLATFORM}"
appcenter build queue -b ${STAGE} -a "yaha/${appId}" --token $APP_CENTER_TOKEN

