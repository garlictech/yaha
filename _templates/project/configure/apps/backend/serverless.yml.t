---
to: apps/backend/serverless.yml
---
org: garlictech
service: <%= app %>
configValidationMode: error
frameworkVersion: ^2.16.1

plugins:
  - serverless-bundle
  - serverless-offline

package:
  individually: true

custom:
  # Our stage is based on what is passed in when running serverless
  # commands. Or falls back to what we have set in the provider section.
  stage: ${opt:stage, self:provider.stage}
  # Name of the SST app that's deploying our infrastructure
  sstApp: ${self:custom.stage}-<%= app %>
  bundle:
    packager: yarn
    linting: false
    sourcemaps: true
    caching: true
    copyFiles:
      - from: ../../libs/neo4j-gql/backend/graphql/schema/hiking-api.graphql
        to: lib/lambda/graphql-neo4j/hiking-api.graphql

  offline:
    useChildProcesses: true

provider:
  name: aws
  runtime: nodejs14.x
  lambdaHashingVersion: 20201221

functions:
  stack-seeder:
    handler: lib/lambda/stack-seeder/index.handler

  consumer-pre-signup:
    handler: lib/lambda/consumer-pre-signup/index.handler
  
  graphql-neo4j:
    handler: lib/lambda/graphql-neo4j/index.handler
    events:
      - http:
          path: graphql
          method: post
          cors: true
      - http:
          path: graphql
          method: get
          cors: true