.PHONY: build clean

REPO=soifou/php-alpine
VERSIONS?="8.1 8.2 8.3"
BUILDKIT_PROGRESS=plain
COMPOSER_VERSION=2.7.2

build:
	# CLI
	docker build -t $(REPO):cli-8.3 --build-arg php_version=83 --build-arg alpine_version=edge cli
	docker build -t $(REPO):cli-8.2 --build-arg php_version=82 --build-arg alpine_version=edge cli
	docker build -t $(REPO):cli-8.1 --build-arg php_version=81 --build-arg alpine_version=3.17 cli
	# CLI (WKHTMLTOPDF)
	docker build -t $(REPO):cli-8.3-wkhtmltopdf --build-arg php_version=8.3 cli-wkhtmltopdf
	docker build -t $(REPO):cli-8.2-wkhtmltopdf --build-arg php_version=8.2 cli-wkhtmltopdf
	docker build -t $(REPO):cli-8.1-wkhtmltopdf --build-arg php_version=8.1 cli-wkhtmltopdf
	# CLI (COMPOSER)
	docker build -t $(REPO):cli-8.3-composer --build-arg php_version=8.3 --build-arg composer_version=$(COMPOSER_VERSION) cli-composer
	docker build -t $(REPO):cli-8.2-composer --build-arg php_version=8.2 --build-arg composer_version=$(COMPOSER_VERSION) cli-composer
	docker build -t $(REPO):cli-8.1-composer --build-arg php_version=8.1 --build-arg composer_version=$(COMPOSER_VERSION) cli-composer
	# FPM
	docker build -t $(REPO):fpm-8.3 --build-arg php_version=83 --build-arg alpine_version=edge fpm
	docker build -t $(REPO):fpm-8.2 --build-arg php_version=82 --build-arg alpine_version=edge fpm
	docker build -t $(REPO):fpm-8.1 --build-arg php_version=81 --build-arg alpine_version=3.17 fpm
	# FPM (WKHTMLTOPDF)
	docker build -t $(REPO):fpm-8.3-wkhtmltopdf --build-arg php_version=8.3 fpm-wkhtmltopdf
	docker build -t $(REPO):fpm-8.2-wkhtmltopdf --build-arg php_version=8.2 fpm-wkhtmltopdf
	docker build -t $(REPO):fpm-8.1-wkhtmltopdf --build-arg php_version=8.1 fpm-wkhtmltopdf

cli:
	# for i in $(VERSIONS) ; do \
	# 	docker build -t $(REPO):cli-$$i --build-arg timezone=$(TIMEZONE) $$i/cli ; \
	# done

fpm:
	# 8.0
	# docker build -t $(REPO):fpm-8 --build-arg php_version=8 --build-arg alpine_version=3.16 fpm
	# 7.4
	# docker build -t $(REPO):fpm-7 --build-arg php_version=7 --build-arg alpine_version=3.15 fpm
	# 7.3
	# docker build -t $(REPO):fpm-7 --build-arg php_version=7 --build-arg alpine_version=3.12 fpm

	# docker build -t $(REPO):
	# for i in $(VERSIONS) ; do \
	# 	docker build -t $(REPO):fpm-$$i --build-arg timezone=$(TIMEZONE) $$i/fpm ; \
	# done

cli-8.3:
	docker build -t $(REPO):cli-8.3 --build-arg php_version=83 --build-arg alpine_version=edge cli
cli-8.2:
	docker build -t $(REPO):cli-8.2 --build-arg php_version=82 --build-arg alpine_version=edge cli
cli-8.1:
	docker build -t $(REPO):cli-8.1 --build-arg php_version=81 --build-arg alpine_version=3.17 cli


clean:
	for i in $(VERSIONS) ; do \
		docker rmi $(REPO):cli-$$i ; \
		docker rmi $(REPO):cli-$$i-wkhtmltopdf ; \
		docker rmi $(REPO):fpm-$$i ; \
		docker rmi $(REPO):fpm-$$i-wkhtmltopdf ; \
	done

test:
	for i in $(VERSIONS) ; do \
		docker run --rm -it $(REPO):cli-$$i -v ; \
		docker run --rm -it $(REPO):cli-$$i -m ; \
		docker run --rm -it $(REPO):cli-$$i -i ; \
	done
