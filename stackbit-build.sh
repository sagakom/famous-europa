#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e69a9ef85948b001b8abe5f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e69a9ef85948b001b8abe5f
curl -s -X POST https://api.stackbit.com/project/5e69a9ef85948b001b8abe5f/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e69a9ef85948b001b8abe5f/webhook/build/publish > /dev/null
