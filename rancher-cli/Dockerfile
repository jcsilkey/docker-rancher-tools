FROM alpine:3.7

RUN apk add --no-cache \
    tini \
    ca-certificates \
    gettext

COPY rancher /bin/rancher

COPY rancher-entrypoint.sh /bin/rancher-entrypoint.sh

RUN chmod +x /bin/rancher-entrypoint.sh

WORKDIR  /rancher

RUN addgroup -S rancher \
    && adduser -S -G rancher rancher

USER rancher

ENTRYPOINT ["/sbin/tini", "--", "/bin/rancher-entrypoint.sh"]

CMD ["help"]
