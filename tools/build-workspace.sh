#!/bin/bash
set -e
IFS='|'

APPNAME=$1
STAGE=$2

HYGEN_OVERWRITE=1 yarn hygen project configure --app=$APPNAME
yarn nx config shared-config --app=$APPNAME --stage=$STAGE
yarn nx build neo4j-gql-api

#if [ $STAGE = 'dev' ]; then
#  yarn nx build admin --skip-nx-cache
#elif [ $STAGE = 'prod' ]; then
#  yarn nx build admin --configuration=production --skip-nx-cache
#else
#  yarn nx build admin --configuration=$STAGE --skip-nx-cache
#fi

yarn nx build backend --app=$APPNAME --stage=$STAGE --skip-nx-cache
