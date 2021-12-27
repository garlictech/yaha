#!/bin/bash
set -e
IFS='|'

ENVNAME=$1
EDITORNAME=${EDITORNAME:-vim}
AWS_PROFILE=${AWS_PROFILE:-default}
echo "ENVNAME=$ENVNAME"
echo "EDITORNAME=$EDITORNAME"
echo "AWS_PROFILE=$AWS_PROFILE"

APPID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/CrudApiAppId" | \
  jq -r '.Parameter.Value')
echo "APPID=$APPID"

USERPOOLID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/AdminUserPoolId" | \
  jq -r '.Parameter.Value')
echo "USERPOOLID=$USERPOOLID"

IDENTITYPOOLID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/IdentityPoolId" | \
  jq -r '.Parameter.Value')
echo "IDENTITYPOOLID=$IDENTITYPOOLID"

WEBCLIENTID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/AdminWebUserPoolClientId" | \
  jq -r '.Parameter.Value')
echo "WEBCLIENTID=$WEBCLIENTID"

NATIVECLIENTID=$(aws ssm get-parameter --name "/${ENVNAME}-yaha/generated/AdminNativeUserPoolClientId" | \
  jq -r '.Parameter.Value')
echo "NATIVECLIENTID=$NATIVECLIENTID"

ANGULARCONFIG="{\
\"SourceDir\":\"../../libs/crud-gql/api/src/lib/generated\",\
\"DistributionDir\":\"../../dist/apps/admin\",\
\"BuildCommand\":\"yarn nx build admin\",\
\"StartCommand\":\"yarn nx serve admin\"\
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
\"frontend\":\"javascript\",\
\"framework\":\"none\",\
\"config\":$ANGULARCONFIG\
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
