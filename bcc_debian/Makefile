KERNEL_VERSION ?= $(shell uname -r)

stop:
	docker rm -fv bcc || /bin/true

build:
	docker build \
		-t bcc \
		--build-arg KERNEL_VERSION=$(KERNEL_VERSION) \
		.

shell: build stop
	docker run \
		-v /sys:/sys \
		--net=host \
		--privileged \
		--rm \
		-it \
		--name bcc \
		bcc \
		bash

run: shell

.PHONY = default
default: build
