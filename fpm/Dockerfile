ARG alpine_version=edge
FROM alpine:$alpine_version
ARG php_version=82
ENV PHP_VERSION=$php_version

COPY packages /tmp/packages

RUN apk add --update --no-cache \
    ca-certificates tzdata imagemagick \
    $(sed -e "s/^/php$PHP_VERSION-/" /tmp/packages | xargs)

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

RUN command -v php-fpm >/dev/null 2>&1 || \
    ln -s /usr/sbin/php-fpm$PHP_VERSION /usr/bin/php-fpm

COPY php.ini /etc/php$PHP_VERSION/conf.d/50_setting.ini
COPY php-fpm.conf /etc/php$PHP_VERSION/php-fpm.conf

# Create dummy user to fix permission
RUN adduser -G wheel -D dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["php-fpm", "-F"]
