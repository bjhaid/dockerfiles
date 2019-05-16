FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ARG KERNEL_VERSION

RUN echo 'deb http://deb.debian.org/debian/ buster main non-free' > /etc/apt/sources.list && \
      apt-get update && \
      apt-get install -y linux-headers-${KERNEL_VERSION} \
      debhelper cmake libllvm7 llvm-dev libclang-dev \
      libelf-dev bison flex libedit-dev clang-format python python-netaddr \
      python-pyroute2 luajit libluajit-5.1-dev arping iperf ethtool \
      devscripts zlib1g-dev libfl-dev git kmod
RUN echo 'deb http://deb.debian.org/debian/ unstable main non-free' > /etc/apt/sources.list && \
      apt-get update && apt-get install -y netperf && \
      git clone https://github.com/iovisor/bcc.git && \
      cd bcc && \
      cmake . && \
      make install && \
      ldconfig

WORKDIR bcc
