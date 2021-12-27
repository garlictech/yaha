#!/bin/bash
set -e
IFS='|'

ENVNAME=$1
MODE="${2:-ci}"

AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin ${AWS_ACCOUNT}.dkr.ecr.$AWS_REGION.amazonaws.com

yarn nx pull-amplify mobile_app --env=$ENVNAME
yarn nx build-schema mobile_app --env=$ENVNAME

yarn nx config shared-config --env=$ENVNAME
yarn nx build backend --env=$ENVNAME
