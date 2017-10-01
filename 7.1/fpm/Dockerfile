FROM alpine:edge

MAINTAINER François Fleur <fleur.fr@gmail.com>

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# @NOTE: still using ssh2|simplexml|tokenizer extension from testing repo
RUN printf "http://php.codecasts.rocks/edge/php-7.1\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    php7 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mongodb \
    php7-mysqli \
    php7-mongodb \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-redis \
    php7-soap \
    php7-phar \
    php7-simplexml \
    php7-soap \
    php7-ssh2 \
    php7-tokenizer \
    php7-xml \
    php7-zip \
    php7-zlib

RUN mv $(find /etc/php7/conf.d/ -name ssh2.ini) /etc/php7/conf.d/25_ssh2.ini

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50_setting.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

# fix permission issue
# @NOTE: set the same group id than the current host user ($ id -g)
# for many Linux distrib id 1000 is fine
RUN addgroup -g 1000 dude && \
    adduser -D  -G dude -s /bin/false -u 1000 dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["php-fpm7", "-F"]