#!/bin/bash
set -e
IFS='|'

STAGE=$1
PLATFORM=$2

echo "Trigger app build in stage ${STAGE}, platform ${PLATFORM}"
appcenter build queue -b ${STAGE} -a "garlictech/yaha-ios-dev" --token $APP_CENTER_TOKEN


