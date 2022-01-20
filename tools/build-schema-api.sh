#!/bin/bash
set -e
IFS='|'

STAGE=$1

yarn graphql-codegen --config tools/graphql-codegen-neo4j.yml

echo "Preparing schema for graphql schema checker..."
cat libs/neo4j-gql/backend/graphql/schema/hiking-api.graphql \
libs/neo4j-gql/backend/graphql/schema/neo4j-types.graphql \
> .github/graphql-inspector-artifacts/schema.graphql
