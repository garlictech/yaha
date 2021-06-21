#!/bin/bash
set -e
IFS='|'

APPNAME=$1
STAGE=$2

HYGEN_OVERWRITE=1 yarn hygen project configure --app=$APPNAME
yarn nx config crud-backend --app=$APPNAME --stage=$STAGE
yarn nx config shared-config --app=$APPNAME --stage=$STAGE
yarn nx build-schema yaha-gql-api 
yarn nx build-schema crud-backend --app=$APPNAME --stage=$STAGE

if [ $STAGE = 'dev' ]; then
  yarn nx build admin --skip-nx-cache
elif [ $STAGE = 'prod' ]; then
  yarn nx build admin --configuration=production --skip-nx-cache
else
  yarn nx build admin --configuration=$STAGE --skip-nx-cache
fi

yarn nx build yaha-backend --app=$APPNAME --stage=$STAGE --skip-nx-cache
