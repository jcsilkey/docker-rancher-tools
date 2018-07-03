#!/bin/sh

set -e

templates="rancher-compose.yml docker-compose.yml"

for template in $templates; do
    if [ -f "templates/${template}" ]; then
        envsubst < "templates/${template}" > "${template}"
    fi
done

set -- rancher-compose "$@"

exec "$@"
