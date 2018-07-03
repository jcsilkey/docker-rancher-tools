FROM alpine:3.7

RUN apk add --no-cache \
    tini \
    ca-certificates \
    gettext

WORKDIR  /rancher

ARG RANCHER_COMPOSE_VERSION

ADD https://github.com/rancher/rancher-compose/releases/download/${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-${RANCHER_COMPOSE_VERSION}.tar.gz /rancher/rancher-compose.tar

RUN tar -xf rancher-compose.tar \
    && mv rancher-compose-${RANCHER_COMPOSE_VERSION}/rancher-compose /bin/rancher-compose \
    && rm -rf rancher-compose.tar rancher-compose-${RANCHER_COMPOSE_VERSION}

COPY rancher-compose-entrypoint.sh /bin/rancher-compose-entrypoint.sh

RUN chmod +x /bin/rancher-compose-entrypoint.sh

RUN addgroup -S rancher \
    && adduser -S -G rancher rancher \
    && chown rancher:rancher /rancher

USER rancher

ENTRYPOINT ["/sbin/tini", "--", "/bin/rancher-compose-entrypoint.sh"]

CMD ["help"]
