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
amplify codegen models

