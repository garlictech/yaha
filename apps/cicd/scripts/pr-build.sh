#!/bin/bash
set -e

ENVNAME=$2

excludes="--exclude=yaha"

./tools/build-workspace.sh ${ENVNAME}
#yarn nx format:check --base={ENVNAME}
#yarn nx affected:lint ${excludes} --base=${ENVNAME} 
#yarn nx affected:test ${excludes} --base=${ENVNAME} 
#yarn nx lint-ci yaha
#yarn nx test-ci yaha
yarn nx buildApk-ci yaha
npx cowsay "YOUR PR IS SUPERCOOL!!!"
