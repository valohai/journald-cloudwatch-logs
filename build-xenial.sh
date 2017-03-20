#!/bin/bash
set -xeuo pipefail
TAG=journald-cloudwatch-logs:$(date '+%Y%m%d.%H%M%S')
docker build -f ubuntu-xenial.dockerfile -t $TAG .
mkdir -p bin
docker run -it $TAG sh -c 'cat ./journald-cloudwatch-logs | base64' | base64 -D > ./bin/journald-cloudwatch-logs-xenial
sha256sum ./bin/journald-cloudwatch-logs-xenial
gzip -k9 ./bin/journald-cloudwatch-logs-xenial
