FROM alpine:3.5

RUN apk add --update --no-cache \
    php5 \
    php5-calendar \
    php5-cli \
    php5-ctype \
    php5-curl \
    php5-dom \
    php5-gd \
    php5-iconv \
    php5-intl \
    php5-json \
    php5-mysql \
    php5-mysqli \
    php5-openssl \
    php5-pdo \
    php5-pdo_mysql \
    php5-phar \
    php5-posix \
    php5-soap \
    php5-xml \
    php5-zip \
    php5-zlib

COPY php.ini /etc/php5/conf.d/50-setting.ini

ENTRYPOINT ["php"]
CMD ["--help"]