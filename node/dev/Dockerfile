FROM debian:buster

MAINTAINER Johan Girard "magicjo@tiglab.net"

ARG USER_UID=1000
ARG USER_GID=1000

ENV NODE_VERSION 14.x

# Install mandatory dependencies
RUN apt-get update &&\
    apt-get install --yes wget curl git unzip build-essential

# Install node-js
RUN curl --silent --location https://deb.nodesource.com/setup_${NODE_VERSION} | bash - &&\
    apt-get install --yes nodejs

# Install fish-shell
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' \
        | tee /etc/apt/sources.list.d/fish.list &&\
    wget --no-verbose https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key \
        -O /etc/apt/trusted.gpg.d/shells:fish:release:3.asc &&\
    apt-get update &&\
    apt-get install --yes fish

# Create current user home
RUN groupadd --gid ${USER_GID} dev &&\
    useradd --uid ${USER_UID} --gid ${USER_GID} --shell /usr/bin/fish --create-home dev
USER ${USER_UID}:${USER_GID}

# Configure fish
RUN mkdir --parent ~/.config/fish &&\
    curl --silent --location https://get.oh-my.fish | fish &&\
    fish --command 'omf install pure'

# Change execution context
WORKDIR /home/dev

# Default coomand
CMD fish
