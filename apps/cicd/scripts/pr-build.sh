#!/bin/bash
set -e

APPNAME=$1
ENVNAME=$2

excludes="--exclude=shared-config --exclude=mobile_app"

./tools/build-workspace.sh ${APPNAME} ${ENVNAME}
#yarn nx format:check 
yarn nx affected:lint --base=${ENVNAME} ${generatedLibExcludes}
yarn nx affected:test --base=${ENVNAME} ${generatedLibExcludes} --codeCoverage --coverageReporters=clover
yarn nx lint-ci mobile_app
yarn nx test-ci mobile_app
yarn nx buildApk-ci mobile_app
npx cowsay "YOUR PR IS SUPERCOOL!!!"
