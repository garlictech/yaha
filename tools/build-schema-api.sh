#!/bin/bash
set -e
IFS='|'

ENVNAME=$1
APPNAME=yaha

echo 'Copy schema...'
echo '=============================='
cp ../../libs/gql-api/src/schema/hiking-api.graphql \
  amplify/backend/api/$APPNAME/schema.graphql

echo
echo 'Compile schema with amplify'
echo '=============================='
amplify api gql-compile --allow-destructive-graphql-schema-updates

echo
echo "Preparing schema for graphql schema checker..."
echo '=============================='
cp amplify/backend/api/${APPNAME}/build/schema.graphql \
   ../../.github/graphql-inspector-artifacts/schema.graphql

echo
echo 'Generate typescript api'
echo '=============================='
cd ../..
yarn graphql-codegen --config tools/graphql-codegen.yml
echo 'Done.'

