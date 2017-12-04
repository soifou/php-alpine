FROM alpine:3.5

RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    php5-cli \
    php5-curl \
    php5-ctype \
    php5-dom \
    php5-iconv \
    php5-json \
    php5-openssl \
    php5-pdo \
    php5-pdo_mysql \
    php5-phar \
    php5-posix \
    php5-soap \
    php5-zip

# Cleanup
RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

COPY php.ini /etc/php5/conf.d/50-setting.ini

ENTRYPOINT ["php"]
CMD ["--help"]