FROM alpine:3.5

ARG timezone=Europe/Paris
ENV TIMEZONE=$timezone

# @FIXME: php7-mongodb not available with repo http://dl-4.alpinelinux.org/alpine/v3.5/main ?
RUN apk upgrade --no-cache && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    php7-bcmath \
    php7-dom \
    php7-ctype \
    php7-curl \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqli \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-posix \
    php7-soap \
    php7-session \
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

COPY php.ini /etc/php7/conf.d/50-setting.ini
# RUN echo "date.timezone = $TIMEZONE" >> /etc/php7/conf.d/50-setting.ini

COPY php-fpm.conf /etc/php7/php-fpm.conf

# Create dummy user to fix permission
RUN adduser -G wheel -D dude
USER dude

WORKDIR /app

EXPOSE 9000

ENTRYPOINT ["php-fpm7", "-F"]