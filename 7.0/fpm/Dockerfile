FROM alpine:3.5

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
    php7-zlib

# Cleanup
RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

COPY php.ini /etc/php7/conf.d/50-setting.ini
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