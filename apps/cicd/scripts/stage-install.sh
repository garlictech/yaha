#!/bin/bash
set -e

./apps/cicd/scripts/common-install.sh
npm install -g cowsay appcenter-cli
npx cowsay "STARTING THE BUILD"
