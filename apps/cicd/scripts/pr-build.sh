#!/bin/bash
set -e

ENVNAME=$2

excludes="--exclude=mobile_app"

./tools/build-workspace.sh ${ENVNAME}
yarn nx format:check --base=${ENVNAME} 
yarn nx affected:lint ${excludes} --base=${ENVNAME} 
yarn nx affected:test ${excludes} --base=${ENVNAME} 
#yarn nx lint-ci mobile_app
#yarn nx test-ci mobile_app
yarn nx buildApk-ci mobile_app
yarn nx synth backend --env=${ENVNAME}
yarn nx synth common-backend --env=dev
npx cowsay "YOUR PR IS SUPERCOOL!!!"
