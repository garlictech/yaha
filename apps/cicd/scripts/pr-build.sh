#!/bin/bash
set -e

ENVNAME=$2

excludes="--exclude=mobile-app"

./tools/build-workspace.sh ${ENVNAME}
yarn nx format:check --base={ENVNAME}
yarn nx affected:lint ${excludes} --base=${ENVNAME} 
#yarn nx affected:test ${excludes} --base=${ENVNAME} 
#yarn nx lint-ci mobile-app
#yarn nx test-ci mobile-app
yarn nx buildApk-ci mobile-app
npx cowsay "YOUR PR IS SUPERCOOL!!!"
