#!/bin/bash
set -e
IFS='|'

ENVNAME=$1
EDITORNAME=${EDITORNAME:-vim}
AWS_PROFILE=${AWS_PROFILE:-default}
echo "ENVNAME=$ENVNAME"
echo "EDITORNAME=$EDITORNAME"
echo "AWS_PROFILE=$AWS_PROFILE"

APPID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/AmplifyApiAppId" | \
  jq -r '.Parameter.Value')
echo "APPID=$APPID"

USERPOOLID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/ConsumerUserPoolId" | \
  jq -r '.Parameter.Value')
echo "USERPOOLID=$USERPOOLID"

IDENTITYPOOLID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/IdentityPoolId" | \
  jq -r '.Parameter.Value')
echo "IDENTITYPOOLID=$IDENTITYPOOLID"

WEBCLIENTID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/ConsumerWebUserPoolClientId" | \
  jq -r '.Parameter.Value')
echo "WEBCLIENTID=$WEBCLIENTID"

NATIVECLIENTID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/ConsumerNativeUserPoolClientId" | \
  jq -r '.Parameter.Value')
echo "NATIVECLIENTID=$NATIVECLIENTID"

FLUTTERCONFIG="{\
\"SourceDir\":\"./lib\"\
}"

JSCONFIG="{\
\"SourceDir\":\"../../libs/gql-api/src/lib/generated\"\
\"DistributionDir\":\"../../dist/apps/js-api\",\
\"BuildCommand\":\"yarn nx build js-api\",\
\"StartCommand\":\"yarn nx serve js-api\"\
}"

AUTHCONFIG="{\
\"userPoolId\":\"$USERPOOLID\",\
\"identityPoolId\":\"$IDENTITYPOOLID\",\
\"webClientId\":\"$WEBCLIENTID\",\
\"nativeClientId\":\"$NATIVECLIENTID\"\
}"

AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"${AWS_PROFILE}\"\
}"

AMPLIFY="{\
\"projectName\":\"amplifyadmin\",\
\"appId\":\"$APPID\",\
\"envName\":\"${ENVNAME}\",\
\"defaultEditor\":\"${EDITORNAME}\"\
}"

FLUTTERFRONTEND="{\
\"frontend\":\"flutter\",\
\"config\":$FLUTTERCONFIG\
}"

JSFRONTEND="{\
\"frontend\":\"javascript\",\
\"framework\":\"none\",\
\"config\":$JSCONFIG\
}"

PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}"

CATEGORIES="{\
\"auth\":$AUTHCONFIG\
}"

echo "...pulling mobile_app..."
pushd apps/mobile_app
amplify pull \
--amplify $AMPLIFY \
--frontend $FLUTTERFRONTEND \
--providers $PROVIDERS \
--categories $CATEGORIES \
--yes

amplify env checkout $ENVNAME
popd

echo "...pulling js-api..."
AMPLIFY_CONFIG_DIR=libs/gql-api/src/lib/generated
rm -rf ${AMPLIFY_CONFIG_DIR}
mkdir -p ${AMPLIFY_CONFIG_DIR}

pushd apps/js-api
amplify pull \
--amplify $AMPLIFY \
--frontend $JSFRONTEND \
--providers $PROVIDERS \
--categories $CATEGORIES \
--yes

amplify env checkout $ENVNAME

# ----------------------------------------------------------
# Get the CRUD table config and write it to a generated file
# ----------------------------------------------------------
echo "Generating table config..."
CRUD_CONFIG_DIR=../../${AMPLIFY_CONFIG_DIR}
TABLE_CONFIG_FILE="$CRUD_CONFIG_DIR/table-config.json"

APINAME=$(aws amplify get-app --app-id $APPID | jq -r ".app.name")
echo "APINAME=$APINAME"

METAFILE=amplify/backend/amplify-meta.json
API_ID=$(jq -r ".api.$APINAME.output.GraphQLAPIIdOutput" $METAFILE)
echo "API_ID=$API_ID"

DATA_SOURCES=$(aws appsync list-data-sources --api-id $API_ID | \
  jq ".dataSources" | \
  jq ".[] | select(.type == \"AMAZON_DYNAMODB\")")

TABLE_NAMES=$(echo $DATA_SOURCES | jq ".dynamodbConfig.tableName" | tr -d '"')
IFS=$'\n'
RESULT="{"

for name in $TABLE_NAMES; do
  RESULT+="  \"$(cut -d '-' -f 1 <<< "$name" )\":"
  TABLE_INFO=$(aws dynamodb describe-table --table-name $name --output json | jq "{TableArn: .Table.TableArn, TableName: .Table.TableName, LatestStreamArn: .Table.LatestStreamArn}")
  RESULT+="  $TABLE_INFO,"
done

# On the CI the SED is not working so this CLOSING TAG is a workaround
RESULT+="\"_closing_tag\": \"dont use me\"}"
echo $RESULT > ${TABLE_CONFIG_FILE}

echo "Table config generated in $TABLE_CONFIG_FILE"
popd
# ----------------------------------------------------------
# Generate crud config
# ----------------------------------------------------------
mv -f ${AMPLIFY_CONFIG_DIR}/aws-exports.js ${AMPLIFY_CONFIG_DIR}/aws-exports.ts
AMPLIFY_CONFIG_FILE=${AMPLIFY_CONFIG_DIR}/amplify-api-config.ts

printf "Generating ${AMPLIFY_CONFIG_FILE}...\n"

echo "
export const AmplifyApiConfig = {
  appId: '${APPID}',
  appsyncApiId: '${API_ID}'
}
" > ${AMPLIFY_CONFIG_FILE}
