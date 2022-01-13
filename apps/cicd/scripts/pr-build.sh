#!/bin/bash
set -e

ENVNAME=$2

excludes="--exclude=shared-config --exclude=mobile_app"

./tools/build-workspace.sh ${ENVNAME}
#yarn nx format:check 
yarn nx affected:lint --base=${ENVNAME} ${generatedLibExcludes}
yarn nx affected:test --base=${ENVNAME} ${generatedLibExcludes} --codeCoverage --coverageReporters=clover
yarn nx lint-ci mobile_app
yarn nx test-ci mobile_app
yarn nx buildApk-ci mobile_app
yarn nx synth backend --env=${ENVNAME}
yarn nx synth common-backend --env=dev
npx cowsay "YOUR PR IS SUPERCOOL!!!"
