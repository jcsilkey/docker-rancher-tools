#!/bin/sh

set -e

envsubst < /rancher/rancher-compose.template.yml > /rancher/rancher-compose.yml
envsubst < /rancher/docker-compose.template.yml > /rancher/docker-compose.yml

set -- rancher "$@"

exec "$@"
