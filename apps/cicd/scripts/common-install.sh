#!/bin/bash
set -e

/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=4096
/sbin/mkswap /var/swap.1
chmod 600 /var/swap.1
chown root:root /var/swap.1
/sbin/swapon /var/swap.1

echo "********************************"
echo "Node version:"
node --version
echo "Yarn version:"
yarn --version
echo "********************************"

nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://127.0.0.1:2375 --storage-driver=overlay2 &
timeout 15 sh -c "until docker info; do echo .; sleep 1; done"
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com
docker pull ${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/yaha-flutter &
chmod +x ./tools/*.sh
./tools/setup-aws-environment.sh 
time yarn --frozen-lockfile 
