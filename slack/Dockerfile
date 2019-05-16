FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ARG USERNAME
ARG ID

RUN apt-get update \
      && apt-get install -y wget \
          libgtk-3-0 \
          libx11-xcb1 \
          libxkbfile1 \
          libcanberra-gtk-module \
      && wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.4.0-amd64.deb \
      && apt install -y ./slack-desktop-3.4.0-amd64.deb libasound2 \
      && useradd --create-home --uid ${ID} --shell /bin/bash ${USERNAME}

USER ${USERNAME}

ENTRYPOINT ["/usr/lib/slack/slack"]
