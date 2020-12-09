FROM alpine:3.8

ARG timezone=Europe/Paris
ENV TIMEZONE=$timezone
ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN echo "https://dl.bintray.com/php-alpine/v3.8/php-7.2" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-ftp \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mysqli \
    php7-mysqlnd \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-redis \
    php7-simplexml \
    php7-soap \
    php7-sodium \
    php7-tokenizer \
    php7-xdebug \
    php7-xml \
    php7-zip \
    php7-zlib \
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

COPY php-fpm.conf /etc/php7/php-fpm.conf

# Create dummy user to fix permission
RUN adduser -G wheel -D dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["php-fpm7", "-F"]
