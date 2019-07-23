.PHONY: build-cli build-fpm test

REPO=soifou/php-alpine
TIMEZONE=Europe/Paris

build-all: build-fpm build-cli

build-cli: 5.6/cli 7.0/cli 7.1/cli 7.2/cli 7.3/cli
	docker build -t $(REPO):cli-5.6 --build-arg timezone=$(TIMEZONE) 5.6/cli
	docker build -t $(REPO):cli-7.0 --build-arg timezone=$(TIMEZONE) 7.0/cli
	docker build -t $(REPO):cli-7.1 --build-arg timezone=$(TIMEZONE) 7.1/cli
	docker build -t $(REPO):cli-7.2 --build-arg timezone=$(TIMEZONE) 7.2/cli
	docker build -t $(REPO):cli-7.3 --build-arg timezone=$(TIMEZONE) 7.3/cli

build-fpm: 5.6/fpm 7.0/fpm 7.1/fpm 7.2/fpm 7.3/fpm
	docker build -t $(REPO):fpm-5.6 --build-arg timezone=$(TIMEZONE) 5.6/fpm
	docker build -t $(REPO):fpm-7.0 --build-arg timezone=$(TIMEZONE) 7.0/fpm
	docker build -t $(REPO):fpm-7.1 --build-arg timezone=$(TIMEZONE) 7.1/fpm
	docker build -t $(REPO):fpm-7.2 --build-arg timezone=$(TIMEZONE) 7.2/fpm
	docker build -t $(REPO):fpm-7.3 --build-arg timezone=$(TIMEZONE) 7.3/fpm

clean:
	docker rmi $(REPO):cli-5.6
	docker rmi $(REPO):cli-7.0
	docker rmi $(REPO):cli-7.1
	docker rmi $(REPO):cli-7.2
	docker rmi $(REPO):cli-7.3
	docker rmi $(REPO):fpm-5.6
	docker rmi $(REPO):fpm-7.0
	docker rmi $(REPO):fpm-7.1
	docker rmi $(REPO):fpm-7.2
	docker rmi $(REPO):fpm-7.3

test:
	# version
	docker run --rm -it $(REPO):cli-5.6 -v
	docker run --rm -it $(REPO):cli-7.0 -v
	docker run --rm -it $(REPO):cli-7.1 -v
	docker run --rm -it $(REPO):cli-7.2 -v
	docker run --rm -it $(REPO):cli-7.3 -v

	# modules
	docker run --rm -it $(REPO):cli-5.6 -m
	docker run --rm -it $(REPO):cli-7.0 -m
	docker run --rm -it $(REPO):cli-7.1 -m
	docker run --rm -it $(REPO):cli-7.2 -m
	docker run --rm -it $(REPO):cli-7.3 -m

	# timezone
	docker run --rm -it $(REPO):cli-5.6 -i | grep "TIMEZONE ="
	docker run --rm -it $(REPO):cli-7.0 -i | grep "TIMEZONE ="
	docker run --rm -it $(REPO):cli-7.1 -i | grep "TIMEZONE ="
	docker run --rm -it $(REPO):cli-7.2 -i | grep "TIMEZONE ="
	docker run --rm -it $(REPO):cli-7.3 -i | grep "TIMEZONE ="
