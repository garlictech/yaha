#!/bin/bash
set -e
IFS='|'

ENVNAME=$1
APPNAME=yahabackend

echo
echo 'Compile schema with amplify'
echo '=============================='
pushd apps/backend > /dev/null
amplify api gql-compile
popd > /dev/null
#amplify api gql-compile --allow-destructive-graphql-schema-updates
#amplify codegen

echo
echo 'Generate typescript api'
echo '=============================='
yarn graphql-codegen --config tools/graphql-codegen.yml
echo 'Done.'

echo "Preparing schema for graphql schema checker..."
cat apps/backend/amplify/backend/api/yahabackend/build/schema.graphql \
  > .github/graphql-inspector-artifacts/schema.graphql
