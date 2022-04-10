#!/bin/bash
set -e
IFS='|'

export AWS_PAGER=""

ENVNAME=$1
APPNAME=${ENVNAME}-yaha

amplify push --yes --allow-destructive-graphql-schema-updates

APPID=$(amplify env get --name ${ENVNAME} --json | \
  jq -r '.awscloudformation.AmplifyAppId')

APINAME=$(aws amplify get-app --app-id $APPID | jq -r ".app.name")
METAFILE=amplify/backend/amplify-meta.json
API_ID=$(jq -r ".api.$APINAME.output.GraphQLAPIIdOutput" $METAFILE)

OS_ENDPOINT=$(aws cloudformation list-exports | \
  jq ".Exports[] | select(.Name == \"$API_ID:GetAtt:OpenSearch:DomainEndpoint\")" | \
  jq ".Value")

printf "Generating ${AMPLIFY_CONFIG_FILE}...\n"
AMPLIFY_CONFIG_FILE=../../libs/gql-api/src/lib/generated/amplify-api-config.ts
mkdir -p $(dirname ${AMPLIFY_CONFIG_FILE})

echo "
export const AmplifyApiConfig = {
  appId: '${APPID}',
  appsyncApiId: '${API_ID}',
  openSearchEndpoint: ${OS_ENDPOINT}
}
" > ${AMPLIFY_CONFIG_FILE}

X=$(aws ssm put-parameter \
  --type String \
  --overwrite \
  --value ${APPID} \
  --name "/${APPNAME}/generated/AmplifyApiAppId")
