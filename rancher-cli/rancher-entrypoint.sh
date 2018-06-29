#!/bin/sh

set -e

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

templates="rancher-compose docker-compose"

for template in $templates; do
    if [ -f "${template}.template.yml" ]; then
        envsubst < "${template}.template.yml" > "${template}.yml"
    fi
done

set -- rancher "$@"

exec "$@"
