ID ?= $(shell id --user)
.PHONY: default
default: build

build:
	docker build \
		--build-arg USERNAME=${USER} \
		--build-arg ID=${ID} \
		-t zoom \
		.

stop:
	docker rm -fv zoom || /bin/true

run: build stop
	docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${HOME}/.zoom:/home/${USER}/.zoom" \
		-v "${HOME}/.config/zoomus.conf:${HOME}/.config/zoomus.conf" \
		-v "${HOME}/.Xdefaults-${USER}:${HOME}/.Xdefaults-${USER}" \
		-e "DISPLAY=unix${DISPLAY}" \
		--device /dev/snd \
		--device /dev/dri \
		--device /dev/video0 \
		--group-add audio \
		--group-add video \
		--ipc host \
		-m 200m \
		--memory-swap -1 \
		--cpus 1 \
		--name zoom \
		zoom
