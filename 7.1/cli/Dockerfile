FROM alpine:edge

MAINTAINER François Fleur <fleur.fr@gmail.com>

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# @NOTE: still using ssh2|simplexml|tokenizer extension from testing repo
# posix extension is used for CLI colors
RUN printf "http://php.codecasts.rocks/edge/php-7.1\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    php7 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mongodb \
    php7-mysqli \
    php7-mongodb \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-posix \
    php7-tokenizer \
    php7-phar \
    php7-redis \
    php7-simplexml \
    php7-soap \
    php7-ssh2 \
    php7-xml \
    php7-zlib

RUN mv $(find /etc/php7/conf.d/ -name ssh2.ini) /etc/php7/conf.d/25_ssh2.ini

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

COPY php.ini /etc/php7/conf.d/50_setting.ini

ENTRYPOINT ["php"]
CMD ["--help"]