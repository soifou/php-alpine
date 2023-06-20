ARG alpine_version=edge
FROM alpine:$alpine_version
ARG php_version=82
ENV PHP_VERSION=$php_version

COPY packages /tmp/packages

RUN apk add --update --no-cache \
    ca-certificates tzdata imagemagick \
    $(sed -e "s/^/php$PHP_VERSION-/" /tmp/packages | xargs)

RUN rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN command -v php >/dev/null 2>&1 || \
    ln -s /usr/bin/php$PHP_VERSION /usr/bin/php

COPY php.ini /etc/php$PHP_VERSION/conf.d/50_setting.ini

ENTRYPOINT ["php"]
CMD ["--help"]
