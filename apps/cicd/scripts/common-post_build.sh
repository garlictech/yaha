#!/bin/bash
set -e

ENVNAME=$1
BUCKET_NAME=$2

tar -cvf ${CODEBUILD_RESOLVED_SOURCE_VERSION}.tgz \
  apps/mobile_app/lib/amplifyconfiguration.dart

aws s3 cp ${CODEBUILD_RESOLVED_SOURCE_VERSION}.tgz s3://$BUCKET_NAME/

echo 'Pushing Android AAB to appcenter'
./tools/publish-to-appcenter.sh ${ENVNAME} android

echo 'Triggering ios app build in appcenter...'
./tools/trigger-appcenter-builds.sh ${ENVNAME} ios

npx cowsay "$ENVNAME DEPLOYMENT OK!!!"
