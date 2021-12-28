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

pushd apps/mobile_app
amplify pull \
--amplify $AMPLIFY \
--frontend $FLUTTERFRONTEND \
--providers $PROVIDERS \
--categories $CATEGORIES \
--yes

amplify env checkout $ENVNAME
popd

pushd apps/js-api
amplify pull \
--amplify $AMPLIFY \
--frontend $JSFRONTEND \
--providers $PROVIDERS \
--categories $CATEGORIES \
--yes

amplify env checkout $ENVNAME
popd

rm -rf  libs/gql-api/src/lib/generated/aws-exports.ts libs/gql-api/src/lib/generated/models
mv -f apps/js-api/src/aws-exports.js libs/gql-api/src/lib/generated/aws-exports.ts
mv -f apps/js-api/src/models libs/gql-api/src/lib/generated/

# ----------------------------------------------------------
# Generate crud config
# ----------------------------------------------------------
AMPLIFY_CONFIG_FILE=libs/gql-api/src/lib/generated/amplify-api-config.ts

printf "Generating ${AMPLIFY_CONFIG_FILE}...\n"

echo "
export const AmplifyApiConfig = {
  appId: '${APPID}',
  appsyncApiId: '${API_ID}'
}
" > ${AMPLIFY_CONFIG_FILE}
