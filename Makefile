.PHONY: build-cli build-fpm clean test

REPO=soifou/php-alpine
TIMEZONE=Europe/Paris
VERSIONS?="5.6 7.0 7.1 7.2 7.3 7.4 8.0"

build-all: build-fpm build-cli

build-cli: 5.6/cli 7.0/cli 7.1/cli 7.2/cli 7.3/cli 7.4/cli 8.0/cli
	for i in $(VERSIONS) ; do \
		docker build -t $(REPO):cli-$$i --build-arg timezone=$(TIMEZONE) $$i/cli ; \
	done

build-fpm: 5.6/fpm 7.0/fpm 7.1/fpm 7.2/fpm 7.3/fpm 7.4/fpm 8.0/fpm
	for i in $(VERSIONS) ; do \
		docker build -t $(REPO):fpm-$$i --build-arg timezone=$(TIMEZONE) $$i/fpm ; \
	done

clean:
	for i in $(VERSIONS) ; do \
		docker rmi $(REPO):cli-$$i ; \
		docker rmi $(REPO):fpm-$$i ; \
	done

test:
	for i in $(VERSIONS) ; do \
		docker run --rm -it $(REPO):cli-$$i -v ; \
		docker run --rm -it $(REPO):cli-$$i -m ; \
		docker run --rm -it $(REPO):cli-$$i -i | grep "TIMEZONE =" ; \
	done
