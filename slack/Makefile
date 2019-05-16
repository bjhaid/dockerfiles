ID ?= $(shell id --user)
build:
	docker build \
		--build-arg USERNAME=${USER} \
		--build-arg ID=${ID} \
		-t slack \
		.

stop:
	docker rm -fv slack || /bin/true

run: build stop
	docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${HOME}/.slack:/home/${USER}/.slack" \
		-v "${HOME}/.config/Slack:${HOME}/.config/Slack" \
		-v "${HOME}/.Xdefaults-${USER}:${HOME}/.Xdefaults-${USER}" \
		-e "DISPLAY=unix${DISPLAY}" \
		--device /dev/snd \
		--device /dev/dri \
		--device /dev/video0 \
		--group-add audio \
		--group-add video \
		--ipc host \
		-m 500m \
		--memory-swap -1 \
		--cpus 3 \
		--restart always \
		--name slack \
		slack

.PHONY = default
default: build
