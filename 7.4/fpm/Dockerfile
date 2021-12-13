FROM alpine:3.10

ARG timezone=Europe/Paris
ENV PHP_VERSION=7.4
# ENV TIMEZONE=$timezone

RUN ALPINE_VERSION=`cat /etc/alpine-release | cut -d'.' -f-2` && \
    wget -O /etc/apk/keys/php-alpine.rsa.pub https://php.hernandev.com/key/php-alpine.rsa.pub && \
    echo "https://php.hernandev.com/v$ALPINE_VERSION/php-$PHP_VERSION" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    php-bcmath \
    php-calendar \
    php-ctype \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-fpm \
    php-ftp \
    php-gd \
    php-iconv \
    php-intl \
    php-json \
    php-mbstring \
    php-mongodb \
    php-mysqli \
    php-mysqlnd \
    php-openssl \
    php-pdo \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-pdo_sqlite \
    php-pgsql \
    php-phar \
    php-redis \
    php-soap \
    php-sodium \
    php-sqlite3 \
    php-xdebug \
    php-xml \
    php-zip \
    php-zlib \
    tzdata

# Match system timezone with the one set in php conf
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
# RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
#     echo "$TIMEZONE" > /etc/timezone \
#     apk del tzdata

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50_setting.ini
RUN sed -i 's/.so//g' /etc/php7/conf.d/00_fileinfo.ini
# RUN echo "date.timezone = $TIMEZONE" >> /etc/php7/conf.d/50_setting.ini

COPY php-fpm.conf /etc/php7/php-fpm.conf

# Create dummy user to fix permission
RUN adduser -G wheel -D dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["php-fpm7", "-F"]
