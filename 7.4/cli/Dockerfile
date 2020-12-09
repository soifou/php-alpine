FROM alpine:3.10

ARG timezone=Europe/Paris
ENV TIMEZONE=$timezone
ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# add the repository, make sure you replace the correct versions if you want.
RUN echo "https://dl.bintray.com/php-alpine/v3.10/php-7.4" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    php \
    php-calendar \
    php-ctype \
    php-curl \
    php-dom \
    php-exif \
    php-ftp \
    php-gd \
    php-iconv \
    php-intl \
    php-json \
    php-mbstring \
    php-mongodb \
    php-mysqli \
    php-mysqlnd \
    php-openssl \
    php-pdo \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-pdo_sqlite \
    php-pgsql \
    php-phar \
    php-posix \
    php-redis \
    php-soap \
    php-sodium \
    php-sqlite3 \
    php-xml \
    php-zip \
    php-zlib \
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

RUN ln -sf /usr/bin/php7 /usr/bin/php

ENTRYPOINT ["/usr/bin/php7"]
CMD ["--help"]
