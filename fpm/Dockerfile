ARG alpine_version=edge
FROM alpine:$alpine_version
ARG php_version=83
ENV PHP_VERSION=$php_version

COPY packages /tmp/packages

# NOTE: package `icu-data-full` allows to use intl correctly.
# See https://github.com/gliderlabs/docker-alpine/issues/144
RUN apk add --update --no-cache \
    ca-certificates tzdata imagemagick icu-libs icu-data-full \
    $(sed -e "s/^/php$PHP_VERSION-/" /tmp/packages | xargs)

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

RUN command -v php-fpm >/dev/null 2>&1 || \
    ln -s /usr/sbin/php-fpm$PHP_VERSION /usr/bin/php-fpm

RUN command -v php >/dev/null 2>&1 || \
    ln -s /usr/bin/php$PHP_VERSION /usr/bin/php

COPY php.ini /etc/php$PHP_VERSION/conf.d/50_setting.ini
COPY php-fpm.conf /etc/php$PHP_VERSION/php-fpm.conf
