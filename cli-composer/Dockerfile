ARG php_version=8.2
FROM soifou/php-alpine:cli-$php_version

ARG composer_version=2.6.3
ENV COMPOSER_VERSION=$composer_version

RUN apk add --update --no-cache \
    ca-certificates git

COPY ./composer.sh /composer.sh
RUN chmod u+x /composer.sh && \
    sh /composer.sh $COMPOSER_VERSION

RUN rm -rf /tmp/src && \
    rm -f /composer.sh \
    rm -rf /var/cache/*

WORKDIR /app
ENTRYPOINT ["/usr/bin/composer"]
CMD ["--help"]
