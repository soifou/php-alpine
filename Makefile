.PHONY: build-cli build-fpm test

REPO=soifou/php-alpine

build-all: build-fpm build-cli

build-cli:
	docker build -t $(REPO):cli-5.6 5.6/cli
	docker build -t $(REPO):cli-7.0 7.0/cli
	docker build -t $(REPO):cli-7.1 7.1/cli
	docker build -t $(REPO):cli-7.2 7.2/cli

build-fpm:
	docker build -t $(REPO):fpm-5.6 5.6/fpm
	docker build -t $(REPO):fpm-7.0 7.0/fpm
	docker build -t $(REPO):fpm-7.1 7.1/fpm
	docker build -t $(REPO):fpm-7.2 7.2/fpm

test:
	docker run --rm -it $(REPO):cli-7.2 -m
	docker run --rm -it $(REPO):cli-7.1 -m
	docker run --rm -it $(REPO):cli-7.0 -m
	docker run --rm -it $(REPO):cli-5.6 -m