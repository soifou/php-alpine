FROM alpine:3.5

RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    php5 \
    php5-bcmath \
    php5-dom \
    php5-calendar \
    php5-ctype \
    php5-curl \
    php5-exif \
    php5-fpm \
    php5-gd \
    php5-iconv \
    php5-intl \
    php5-json \
    php5-mcrypt \
    php5-mysql \
	php5-mysqli \
    php5-openssl \
    php5-pdo \
    php5-pdo_mysql \
    php5-soap \
    php5-xdebug \
    php5-xml \
    php5-zip \
    php5-zlib

# Cleanup
RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

COPY php.ini /etc/php5/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php5/php-fpm.conf

# fix permission issue
# @NOTE: set the same group id than the current host user ($ id -g)
# for many Linux distrib id 1000 is fine
RUN addgroup -g 1000 dude && \
    adduser -D  -G dude -s /bin/false -u 1000 dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["/usr/bin/php-fpm5", "-F"]
