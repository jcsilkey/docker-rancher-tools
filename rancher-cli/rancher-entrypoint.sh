#!/bin/sh

set -e

envsubst < /rancher/rancher-compose.template.yml > /rancher/rancher-compose.yml
envsubst < /rancher/docker-compose.template.yml > /rancher/docker-compose.yml
rancher_env_vars="RANCHER_URL RANCHER_ACCESS_KEY RANCHER_SECRET_KEY RANCHER_ENVIRONMENT"

missing_env_vars=0

for rancher_env_var in $rancher_env_vars; do
    if [ -z $(eval echo \$$rancher_env_var) ]; then
        echo "${rancher_env_var} environment variable is required"
        missing_env_vars=1
    fi
done

if [ $missing_env_vars != 0 ]; then
    exit 1
fi

set -- rancher "$@"

exec "$@"
