FROM alpine:3.11

ARG timezone=Europe/Paris
ENV PHP_VERSION=7.4
# ENV TIMEZONE=$timezone

RUN ALPINE_VERSION=`cat /etc/alpine-release | cut -d'.' -f-2` && \
    wget -O /etc/apk/keys/php-alpine.rsa.pub https://php.hernandev.com/key/php-alpine.rsa.pub && \
    echo "https://php.hernandev.com/v$ALPINE_VERSION/php-$PHP_VERSION" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    php7 \
    php-calendar \
    php-ctype \
    php-curl \
    php-dom \
    php-exif \
    php-ftp \
    php-gd \
    php-iconv \
    php-intl \
    php-mbstring \
    php-mysqli \
    php-mysqlnd \
    php-openssl \
    php-pdo \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-pdo_sqlite \
    php-pgsql \
    php-phar \
    php-posix \
    php-soap \
    php-sodium \
    php-sqlite3 \
    php-xml \
    php-zip \
    tzdata

# Match system timezone with the one set in php conf
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
# RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
#     echo "$TIMEZONE" > /etc/timezone \
#     apk del tzdata

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50_setting.ini
# RUN echo "date.timezone = $TIMEZONE" >> /etc/php7/conf.d/50_setting.ini

RUN ln -sf /usr/bin/php7 /usr/bin/php

ENTRYPOINT ["/usr/bin/php7"]
CMD ["--help"]
