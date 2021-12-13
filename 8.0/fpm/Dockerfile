FROM alpine:3.12

ARG timezone=Europe/Paris
ENV PHP_VERSION 8.0
# ENV TIMEZONE=$timezone

RUN ALPINE_VERSION=`cat /etc/alpine-release | cut -d'.' -f-2` && \
    wget -O /etc/apk/keys/php-alpine.rsa.pub https://php.hernandev.com/key/php-alpine.rsa.pub && \
    echo "https://php.hernandev.com/v$ALPINE_VERSION/php-$PHP_VERSION" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    php8-bcmath \
    php8-calendar \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fpm \
    php8-ftp \
    php8-gd \
    php8-iconv \
    php8-intl \
    php8-mbstring \
    php8-mongodb \
    php8-mysqli \
    php8-mysqlnd \
    php8-openssl \
    php8-pdo \
    php8-pdo_mysql \
    php8-pdo_pgsql \
    php8-pdo_sqlite \
    php8-pgsql \
    php8-phar \
    php8-redis \
    php8-soap \
    php8-sodium \
    php8-sqlite3 \
    php8-xdebug \
    php8-xml \
    php8-zip \
    php8-zlib \
    tzdata

# Match system timezone with the one set in php conf
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
# RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
#     echo "$TIMEZONE" > /etc/timezone \
#     apk del tzdata

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php8/conf.d/50_setting.ini
# RUN echo "date.timezone = $TIMEZONE" >> /etc/php8/conf.d/50_setting.ini

COPY php-fpm.conf /etc/php8/php-fpm.conf

# Create dummy user to fix permission
RUN adduser -G wheel -D dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["php-fpm8", "-F"]
