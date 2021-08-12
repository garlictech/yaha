#!/bin/bash
set -e

APPNAME=$1
STAGE=$2

generatedLibExcludes="--exclude=shared-config --exclude=yaha-gql-api --exclude=crud-gql-api"

./tools/build-workspace.sh ${APPNAME} ${STAGE}
#yarn nx format:check 
yarn nx affected:lint --base=${STAGE} --exclude="mobile_app" ${generatedLibExcludes}
yarn nx affected:test --base=${STAGE} --exclude="integration-tests-universal" --exclude="mobile_app" ${generatedLibExcludes} --codeCoverage --coverageReporters=clover
yarn nx lint-ci mobile_app
yarn nx test-ci mobile_app
yarn nx buildApk-ci mobile_app
npx cowsay "YOUR PR IS SUPERCOOL!!!"