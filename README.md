# PHP CLI/FPM on Alpine Linux

Alpine Linux built with common PHP extensions.

## Install

Git clone the repository then build the desired image.
For instance, to build the cli version of PHP 8.1.

```sh
git clone https://github.com/soifou/php-alpine
cd php-alpine
make build
```

See the provided [Makefile](./Makefile) to know how to build.

## Tags

Versions and tags are based on PHP 5.x, 7.x and 8.x versions.

- `cli` tag is designed to be used for command line stuff
- `fpm` tag is designed to be used with PHP-FPM (and fits very well with an Alpine/Nginx docker image).

| cli              | fpm               |
| ---------------- | ----------------- |
| `cli-8.2` (64MB) | `fpm-8.2` (73MB)  |
| `cli-8.1` (58MB) | `fpm-8.1` (67MB)  |
| `cli-8.0`        | `fpm-8.0`         |
| `cli-7.4` (83MB) | `fpm-7.4` (101MB) |
| `cli-7.3`        | `fpm-7.3`         |
| `cli-7.2`        | `fpm-7.2`         |
| `cli-7.1`        | `fpm-7.1`         |
| `cli-7.0`        | `fpm-7.0`         |
| `cli-5.6`        | `fpm-5.6`         |

- `cli-wkhtmltopdf` and `fpm-wkhtmltopdf` variant embarks the [docker-alpine-wkhtmltopdf](https://github.com/madnight/docker-alpine-wkhtmltopdf), the size of the image then increases aproximately to 100MB.
- `cli-composer` variant include [php composer](https://getcomposer.org)
  s

| cli-composer              | cli-wkhtmltopdf               | fpm-wkhtmltopdf               |
| ------------------------- | ----------------------------- | ----------------------------- |
| `cli-8.2-composer`        | `cli-8.2-wkhtmltopdf` (191MB) | `fpm-8.2-wkhtmltopdf` (200MB) |
| `cli-8.1-composer` (61MB) | `cli-8.1-wkhtmltopdf` (198MB) | `fpm-8.1-wkhtmltopdf` (207MB) |
| -                         | -                             | -                             |
| -                         | -                             | -                             |
| -                         | -                             | -                             |
| -                         | -                             | -                             |
| -                         | -                             | -                             |
| -                         | -                             | -                             |
| -                         | -                             | -                             |

## Wkhtmltopdf variant

To use wkhtmltopdf inside a docker app, you'll need to set the hostname of the app in the php container because wkhtmltopdf need to fetch some assets for rendering.

```yaml
---
version: '3.7'

networks:
    lamp-network:
        name: lamp-network
        ipam:
            driver: default
            config:
                - subnet: "172.18.0.0/24"
services:
    web:
        image: nginx:1.19-alpine
        ...
        networks:
            lamp-network:
                ipv4_address: 172.18.0.6

    php:
        image: soifou/php-alpine:fpm-8.2-wkhtmltopdf
        ...
        networks:
            - lamp-network
        extra_hosts:
            # wkhtmltopdf need to know the hostname to fetch assets
            - website.org:172.18.0.6
```

## Composer variant

```sh
composer() {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        -u $(id -u):$(id -g) \
        --env COMPOSER_HOME=/composer \
        -v $COMPOSER_HOME:/composer \
        --env COMPOSER_CACHE_DIR=/composer/cache \
        -v $COMPOSER_CACHE_DIR:/composer/cache \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $(pwd):/app \
        --env SSH_AUTH_SOCK=/ssh-auth.sock \
        -v $SSH_AUTH_SOCK:/ssh-auth.sock \
        --net=$DOCKER_NETWORK_NAME \
        soifou/php-alpine:cli-${PHP_VERSION:-8.2}-composer ${@:1}
}
```
