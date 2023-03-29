ARG php_version=8.2
FROM soifou/php-alpine:fpm-$php_version

USER root
#################################################################################################
# Wkhtmltopdf 0.12.5-dev with patched Qt
# See: https://github.com/StefanStefanoff/docker-alpine-wkhtmltopdf
#################################################################################################
RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation openssl1.1-compat

COPY --from=atrelios/docker-alpine-wkhtmltopdf:latest-amd64 \
    /bin/wkhtmltopdf /usr/bin/wkhtmltopdf

RUN chmod +x /usr/bin/wkhtmltopdf && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*
#################################################################################################
USER dude
