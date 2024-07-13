ARG php_version=8.2
FROM soifou/php-alpine:fpm-$php_version

# NOTE: This arg must come after FROM
# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG alpine_version=edge

USER root

RUN apk add --no-cache \
        libstdc++ \
        libx11 \
        libxrender \
        libxext \
        libssl3 \
        ca-certificates \
        fontconfig \
        freetype \
        ttf-droid \
        ttf-freefont \
        ttf-liberation

COPY --from=surnet/alpine-wkhtmltopdf:3.20.1-0.12.6-small /bin/wkhtmltopdf /bin/

RUN chmod +x /bin/wkhtmltopdf && \
    ln -s /bin/wkhtmltopdf /usr/bin/wkhtmltopdf && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

USER dude
