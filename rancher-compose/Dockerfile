FROM alpine:3.7

RUN apk add --no-cache \
    tini \
    ca-certificates \
    gettext

COPY rancher-compose /bin/rancher-compose

COPY rancher-compose-entrypoint.sh /bin/rancher-compose-entrypoint.sh

RUN chmod +x /bin/rancher-compose-entrypoint.sh

WORKDIR  /rancher

RUN addgroup -S rancher \
    && adduser -S -G rancher rancher

USER rancher

ENTRYPOINT ["/sbin/tini", "--", "/bin/rancher-compose-entrypoint.sh"]

CMD ["help"]
