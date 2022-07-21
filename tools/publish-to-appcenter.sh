#!/bin/bash
set -e
IFS='|'

STAGE=$1
PLATFORM=$2

appId="yaha-$PLATFORM-$STAGE"

if [ $PLATFORM = 'android' ]; then
  appImagePath=${CODEBUILD_SRC_DIR:-$PWD}/apps/mobile-app/build/app/outputs/bundle/release/app-release.aab
else
  echo "Unsupported platform: ${PLATFORM}"
  exit 1
fi

if [[ -z ${appImagePath} ]]
then
    echo "No app image were found at ${appImagePath}, skip publishing to App Center"
    exit 1
fi

echo "Publishing to stage ${STAGE}, platform ${PLATFORM}"
echo "Using image at $appImagePath"

appcenter distribute release \
    --group Collaborators \
    --file "${appImagePath}" \
    --release-notes 'App submission via AWS CodePipeline' \
    --app "garlictech/${appId}" \
    --token "${APP_CENTER_TOKEN}" \
    --quiet
