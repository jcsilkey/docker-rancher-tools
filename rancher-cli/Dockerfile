FROM alpine:3.7

RUN apk add --no-cache \
    tini \
    ca-certificates \
    gettext

WORKDIR  /rancher

ARG RANCHER_CLI_VERSION

ADD https://github.com/rancher/cli/releases/download/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz /rancher/rancher.tar

RUN tar -xf rancher.tar \
    && mv rancher-${RANCHER_CLI_VERSION}/rancher /bin/rancher \
    && rm -rf rancher.tar rancher-${RANCHER_CLI_VERSION}

COPY rancher-entrypoint.sh /bin/rancher-entrypoint.sh

RUN chmod +x /bin/rancher-entrypoint.sh

RUN addgroup -S rancher \
    && adduser -S -G rancher rancher \
    && chown rancher:rancher /rancher

USER rancher

ENTRYPOINT ["/sbin/tini", "--", "/bin/rancher-entrypoint.sh"]

CMD ["help"]
