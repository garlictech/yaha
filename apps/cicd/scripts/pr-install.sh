#!/bin/bash
set -e

nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://127.0.0.1:2375 --storage-driver=overlay2 &
timeout 15 sh -c "until docker info; do echo .; sleep 1; done"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 697486207432.dkr.ecr.us-east-1.amazonaws.com
docker pull 697486207432.dkr.ecr.us-east-1.amazonaws.com/yaha-flutter &
chmod +x ./tools/*.sh
./tools/setup-aws-environment.sh 
time npm install -g @aws-amplify/cli cowsay 
time yarn --frozen-lockfile 
npx cowsay "STARTING PR CHECK"
