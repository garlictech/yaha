#!/bin/bash
set -e
IFS='|'

ENVNAME=$1
rm -rf cdk.out
mkdir -p build

LAMBDAS="amplify-resolvers
graphql-neo4j
yaha-api-updater"

IFS=$'\n'

for name in $LAMBDAS; do
  mkdir -p ./build/$name
  yarn esbuild lib/lambda/$name/index.ts \
    --target=node14 \
    --external:aws-sdk \
    --bundle \
    --platform=node \
    --minify \
    --outfile=./build/$name/index.js
done

cp lib/lambda/graphql-neo4j/hiking-api.graphql ./build/graphql-neo4j

cd ../..
