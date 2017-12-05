FROM alpine:3.5

# @FIXME: mongodb/redis/ssh2 not available in 3.5 repo
RUN apk upgrade -U && \
    php7 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
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

# Cleanup
RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

# Small fixes
RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    rm -fr /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50-setting.ini

ENTRYPOINT ["php"]
CMD ["--help"]