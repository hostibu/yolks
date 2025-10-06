## Select OS
FROM --platform=$TARGETOS/$TARGETARCH debian:stable-slim

## Configure
LABEL author="Hostibu" maintainer="operasyon@hostibu.com"

ENV DEBIAN_FRONTEND=noninteractive

## Install Dependencies
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt upgrade -y && \
    apt install -y \
        curl \
        tar \
        ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

## Create User
RUN useradd -m -d /home/container -s /bin/bash container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

## Run script
COPY ./run.sh /run.sh
CMD [ "/bin/bash", "/run.sh" ]

## libstdc++6 libstdc++6:i386 lib32gcc1