FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ARG USERNAME
ARG ID

RUN apt-get update \
      && apt-get install -y wget libnss3 libasound2 \
      && wget https://zoom.us/client/latest/zoom_amd64.deb \
      && apt install -y ./zoom_amd64.deb \
      && useradd --create-home --uid ${ID} --shell /bin/bash ${USERNAME}

USER ${USERNAME}

ENTRYPOINT ["/opt/zoom/ZoomLauncher"]
