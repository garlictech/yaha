#!/bin/bash

# Must be executed from apps/common-backend

set -e
IFS='|'

ENVNAME=$1

STACKCONFIG_FILE=libs/shared/config/src/lib/common-stack-config.json

yarn sst deploy --stage=$ENVNAME --outputs-file ../../$STACKCONFIG_FILE

# Process stack-config: remove stage label
cd ../..
echo "Creating stack config for testing ($STACKCONFIG_FILE)"
sed -i "" "s/^  \"${ENVNAME}\-common\-backend/\"common-backend/g" $STACKCONFIG_FILE

