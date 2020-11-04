#!/usr/bin/env bash

set -o errexit

docker build \
		--force-rm --pull --no-cache \
		--file Dockerfile \
		--tag "magicjo/node:dev" .
