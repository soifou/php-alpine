FROM alpine:3.7

ARG timezone=Europe/Paris
ENV TIMEZONE=$timezone

RUN apk add --update --no-cache \
    ca-certificates \
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
    php7-mcrypt \
    # php7-mongodb \
    php7-mysqli \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-posix \
    php7-redis \
    php7-soap \
    php7-ssh2 \
    php7-xml \
    php7-zip \
    php7-zlib \
    tzdata

# Match system timezone with the one set in php conf
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "$TIMEZONE" > /etc/timezone \
    apk del tzdata

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50_setting.ini
RUN echo "date.timezone = $TIMEZONE" >> /etc/php7/conf.d/50_setting.ini

ENTRYPOINT ["php7"]
CMD ["--help"]