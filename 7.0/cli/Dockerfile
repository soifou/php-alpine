FROM alpine:edge

RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    php7 \
    php7-curl \
    php7-ctype \
    php7-dom \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mongodb \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-posix \
    php7-session

# Small fixes
RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    rm -fr /var/cache/apk/*

COPY php.ini /etc/php7

ENTRYPOINT ["php"]
CMD ["--help"]