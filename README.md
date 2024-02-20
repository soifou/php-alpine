# PHP CLI/FPM on Alpine Linux

Alpine Linux built with common [PHP extensions](./cli/packages) and
[Image Magick](https://github.com/ImageMagick/ImageMagick).

## Install

Git clone the repository then build the desired image.

```sh
git clone https://github.com/soifou/php-alpine
cd php-alpine
make build
```

See the provided [Makefile](./Makefile) to know how and what to build. You need
at least the "base" version in order to build a variant. Why is that? Because
this considerably speedup the build process.

Eg. `cli-8.3-whktmltopdf` depends on `cli-8.3` and so on.

## Tags

Versions and tags are based on PHP 5.x, 7.x and 8.x versions.

- `cli` tag is designed to be used for command line stuff
- `fpm` tag is designed to be used with PHP-FPM (and fits very well with an
  Alpine/Nginx docker image).

| cli       | fpm       |
| --------- | --------- |
| `cli-8.3` | `fpm-8.3` |
| `cli-8.2` | `fpm-8.2` |
| `cli-8.1` | `fpm-8.1` |
| `cli-8.0` | `fpm-8.0` |
| `cli-7.4` | `fpm-7.4` |
| `cli-7.3` | `fpm-7.3` |
| `cli-7.2` | `fpm-7.2` |
| `cli-7.1` | `fpm-7.1` |
| `cli-7.0` | `fpm-7.0` |
| `cli-5.6` | `fpm-5.6` |

- `wkhtmltopdf` variant embarks the
  [docker-alpine-wkhtmltopdf](https://github.com/madnight/docker-alpine-wkhtmltopdf),
  the size of the image then increases aproximately to 100MB.
- `composer` variant include [php composer](https://getcomposer.org)

| cli-composer       | cli-wkhtmltopdf       | fpm-wkhtmltopdf       |
| ------------------ | --------------------- | --------------------- |
| `cli-8.3-composer` | `cli-8.3-wkhtmltopdf` | `fpm-8.3-wkhtmltopdf` |
| `cli-8.2-composer` | `cli-8.2-wkhtmltopdf` | `fpm-8.2-wkhtmltopdf` |
| `cli-8.1-composer` | `cli-8.1-wkhtmltopdf` | `fpm-8.1-wkhtmltopdf` |

## Wkhtmltopdf variant

To use wkhtmltopdf inside a docker app, you'll need to set the hostname of the
app in the php container because wkhtmltopdf need to fetch some assets for
rendering.

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
