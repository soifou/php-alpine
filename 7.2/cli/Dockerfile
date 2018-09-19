FROM alpine:3.8

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# add the repository, make sure you replace the correct versions if you want.
# posix extension is used for CLI colors
RUN echo "@php https://php.codecasts.rocks/v3.8/php-7.2" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    php7@php \
    php7-calendar@php \
    php7-ctype@php \
    php7-curl@php \
    php7-dom@php \
    php7-ftp@php \
    php7-gd@php \
    php7-iconv@php \
    php7-intl@php \
    php7-json@php \
    php7-mbstring@php \
    php7-mongodb@php \
    php7-mysqli@php \
    php7-openssl@php \
    php7-pdo@php \
    php7-pdo_mysql@php \
    php7-phar@php \
    php7-posix@php \
    php7-redis@php \
    php7-soap@php \
    php7-sodium@php \
    php7-ssh2@php \
    php7-xml@php \
    php7-zip@php \
    php7-zlib@php

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

COPY php.ini /etc/php7/conf.d/50_setting.ini

ENTRYPOINT ["php7"]
CMD ["--help"]
