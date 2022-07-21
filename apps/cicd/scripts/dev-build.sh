#!/bin/bash
set -e

ENVNAME=$1
CI=$2

./tools/build-workspace.sh $ENVNAME $CI

#if [ "$ENVNAME" = "dev" ]; then
#  yarn nx deploy common-backend --env=${ENVNAME}
#fi

yarn nx deploy-amplify mobile-app --env=${ENVNAME}
yarn nx deploy backend --env=${ENVNAME}
yarn nx buildAppbundle-ci mobile-app

npx cowsay "PROJECT BUILD OK!!!"
