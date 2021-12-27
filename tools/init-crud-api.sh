#!/bin/bash
set -e
IFS='|'

APPNAME=$1
STAGE=$2
EDITORNAME=${EDITORNAME:-vim}

AWSCLOUDFORMATIONconfig="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"${AWS_PROFILE}\"\
}"

AMPLIFY="{\
\"projectName\":\"$APPNAME\",\
\"envName\":\"${STAGE}\",\
\"defaultEditor\":\"${EDITORNAME}\"\
}"

FRONTEND="{\
\"frontend\":\"javascript\",\
\"framework\":\"none\",\
\"config\":$ANGULARconfig\
}"

PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONconfig\
}"

X=$(amplify init \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--yes)

APPID=$(amplify env get --name ${STAGE} --json | jq -r '.awscloudformation.AmplifyAppId')

aws ssm put-parameter \
  --type String \
  --overwrite \
  --value ${APPID} \
  --name "/${STAGE}-${APPNAME}/generated/AmplifyAppId"

