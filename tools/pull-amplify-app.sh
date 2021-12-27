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

FRONTEND="{\
\"frontend\":\"flutter\",\
\"config\":$FLUTTERCONFIG\
}"

PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}"

CATEGORIES="{\
\"auth\":$AUTHCONFIG\
}"

amplify pull \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--categories $CATEGORIES \
--yes

amplify env checkout $ENVNAME

# ----------------------------------------------------------
# Generate crud config
# ----------------------------------------------------------
AMPLIFY_CONFIG_FILE=../../libs/gql-api/src/lib/generated/amplify-api-config.ts

printf "Generating ${AMPLIFY_CONFIG_FILE}...\n"

echo "
export const AmplifyApiConfig = {
  appId: '${APPID}',
  appsyncApiId: '${API_ID}'
}
" > ${AMPLIFY_CONFIG_FILE}
