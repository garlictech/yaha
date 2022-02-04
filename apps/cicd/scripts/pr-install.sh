#!/bin/bash
set -e


./apps/cicd/scripts/common-install.sh
npm install -g @aws-amplify/cli cowsay 
echo "********************************"
echo "Amplify version:"
amplify --version
echo "********************************"
npx cowsay "STARTING PR CHECK"
