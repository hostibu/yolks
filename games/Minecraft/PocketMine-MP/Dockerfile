## Select OS
FROM --platform=$TARGETOS/$TARGETARCH debian:stable-slim

## Configure
LABEL author="Hostibu" maintainer="operasyon@hostibu.com"

# Terminal
ENV DEBIAN_FRONTEND=noninteractive

## Commands
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl tar jq libcurl4 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -d /home/container -s /bin/bash container

## Security
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

## Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/bash", "/run.sh" ]