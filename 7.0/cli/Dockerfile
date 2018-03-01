FROM alpine:3.5

RUN apk add --update --no-cache \
    php7 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-ftp \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mysqli \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-posix \
    php7-session \
    php7-soap \
    php7-xml \
    php7-zip \
    php7-zlib

COPY php.ini /etc/php7/conf.d/50-setting.ini

ENTRYPOINT ["php7"]
CMD ["--help"]