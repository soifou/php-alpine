ARG php_version=8.2
FROM soifou/php-alpine:cli-$php_version

# NOTE: This arg must come after FROM
# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG alpine_version=edge

#################################################################################################
# Wkhtmltopdf 0.12.5-dev with patched Qt
# See: https://github.com/StefanStefanoff/docker-alpine-wkhtmltopdf
#################################################################################################

# FIXME: openssl1.1-compat available only on testing repo?
RUN echo "https://dl-cdn.alpinelinux.org/alpine/$alpine_version/testing" >> /etc/apk/repositories && \
    apk add --update --no-cache \
        libgcc libstdc++ libx11 glib libxrender libxext libintl \
        ttf-dejavu ttf-droid ttf-freefont ttf-liberation openssl1.1-compat

COPY --from=atrelios/docker-alpine-wkhtmltopdf:latest-amd64 \
    /bin/wkhtmltopdf /usr/bin/wkhtmltopdf

RUN chmod +x /usr/bin/wkhtmltopdf && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*
