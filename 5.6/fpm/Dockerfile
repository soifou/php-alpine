FROM alpine:3.5

ARG timezone=Europe/Paris
ENV TIMEZONE=$timezone

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
    php5-zlib \
    tzdata

# Match system timezone with the one set in php conf
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "$TIMEZONE" > /etc/timezone \
    apk del tzdata

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

COPY php.ini /etc/php5/conf.d/50-setting.ini
RUN echo "date.timezone = $TIMEZONE" >> /etc/php5/conf.d/50-setting.ini

COPY php-fpm.conf /etc/php5/php-fpm.conf

# Create dummy user to fix permission
RUN adduser -G wheel -D dude
USER dude

WORKDIR /app
EXPOSE 9000
ENTRYPOINT ["/usr/bin/php-fpm5", "-F"]
