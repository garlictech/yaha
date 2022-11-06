#!/bin/bash
set -e

ENVNAME=$1
CI=$2

./tools/build-workspace.sh $ENVNAME $CI

#if [ "$ENVNAME" = "dev" ]; then
#  yarn nx deploy common-backend --env=${ENVNAME}
#fi

yarn nx deploy backend --env=${ENVNAME}
yarn nx buildAppbundle-ci yaha

npx cowsay "PROJECT BUILD OK!!!"
