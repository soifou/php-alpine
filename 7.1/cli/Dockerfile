FROM alpine:3.7

ARG timezone=Europe/Paris
ENV TIMEZONE=$timezone
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.1" >> /etc/apk/repositories && \
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
    php7-mcrypt@php \
    php7-mongodb@php \
    php7-mysqli@php \
    php7-openssl@php \
    php7-pdo@php \
    php7-pdo_mysql@php \
    php7-phar@php \
    php7-posix@php \
    php7-redis@php \
    php7-soap@php \
    php7-ssh2@php \
    php7-xml@php \
    php7-zip@php \
    php7-zlib@php \
    tzdata

# Match system timezone with the one set in php conf
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "$TIMEZONE" > /etc/timezone \
    apk del tzdata

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50_setting.ini
RUN echo "date.timezone = $TIMEZONE" >> /etc/php7/conf.d/50_setting.ini

ENTRYPOINT ["php7"]
CMD ["--help"]