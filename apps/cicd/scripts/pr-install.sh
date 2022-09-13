#!/bin/bash
set -e


./apps/cicd/scripts/common-install.sh
npm install -g cowsay 
npx cowsay "STARTING PR CHECK"
