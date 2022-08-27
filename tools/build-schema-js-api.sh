#!/bin/bash
set -e
IFS='|'

echo
echo 'Generate typescript api'
echo '=============================='
cd ../..
yarn graphql-codegen --config tools/graphql-codegen.yml
echo 'Done.'

