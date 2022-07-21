#!/bin/bash
set -e
IFS='|'

pushd 'apps/mobile-app'

#ENVNAME=$(amplify status | grep "Current Environment" | rev | cut -d ' ' -f 1 | rev)
ENVNAME=$1
FUNCTION_NAME=$2 # like amplify-anyuppbackend-sta-OpenSearchStreamingLambd-iNsDbhVYGANu
echo "ENVNAME: $ENVNAME"

APPID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/AmplifyApiAppId" | \
  jq -r '.Parameter.Value')
echo "APPID=$APPID"

APINAME=$(aws amplify get-app --app-id $APPID | jq -r ".app.name")
echo "APINAME=$APINAME"

METAFILE=amplify/backend/amplify-meta.json
API_ID=$(jq -r ".api.$APINAME.output.GraphQLAPIIdOutput" $METAFILE)
echo "API_ID=$API_ID"

DATA_SOURCES=$(aws appsync list-data-sources --api-id $API_ID | \
  jq ".dataSources" | \
  jq ".[] | select(.type == \"AMAZON_DYNAMODB\")")

TABLE_NAMES=$(echo $DATA_SOURCES | jq ".dynamodbConfig.tableName" | tr -d '"')

popd

IFS=$'\n'

for name in $TABLE_NAMES; do
  python3 tools/reindex-tables/ddb_to_es.py \
  --rn $AWS_REGION \
  --tn $name \
  --lf "arn:aws:lambda:${AWS_REGION}:${AWS_ACCOUNT}:function:${FUNCTION_NAME}" \
  --esarn "arn:aws:dynamodb:${AWS_REGION}:${AWS_ACCOUNT}:table/${name}/stream"
done
#--lf "arn:aws:lambda:${AWS_REGION}:${AWS_ACCOUNT}:function:DdbToEsFn-${API_ID}-${ENVNAME}" \
