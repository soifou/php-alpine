FROM php:7.1-alpine

RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
        libcurl curl-dev \
        libmcrypt-dev \
        icu-dev \
        libxml2-dev zlib-dev && \
    docker-php-ext-install \
        bcmath \
        curl \
        iconv \
        intl \
        json \
        mbstring \
        mcrypt \
        mysqli \
        pdo \
        pdo_mysql \
        soap \
        xml \
        zip && \
        rm -fr /var/cache/apk/*

# Small fixes
RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    rm -fr /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50-setting.ini

ENTRYPOINT ["php"]
CMD ["--help"]