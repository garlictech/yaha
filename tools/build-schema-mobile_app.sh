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

ls -l amplify/backend/api/${APPNAME}/build/schema.graphql
ls -l ../../libs/gql-api/src/schema/aws.graphql
ls -l build
cat \
  amplify/backend/api/${APPNAME}/build/schema.graphql \
  ../../libs/gql-api/src/schema/aws.graphql \
  > build/schema.graphql

echo 'Generating Dart models from schema...'
echo '===================================='
if [[ $MODE = 'ci' ]]
then
  echo 'Build Mobile schema in docker container (CI mode)'
    #yarn nx pub-get-ci mobile_app
    yarn nx graphql-codegen-ci mobile_app
else
    echo 'Build Mobile schema in development mode'
    #yarn nx pub-get mobile_app
    yarn nx graphql-codegen mobile_app
fi

echo 'Done.'


