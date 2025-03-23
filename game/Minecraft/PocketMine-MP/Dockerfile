## Select OS
FROM debian:stable-slim

## Configure
LABEL author="Hostibu" maintainer="destek@hostibu.com"

# Terminal
ENV DEBIAN_FRONTEND=noninteractive

## Commands
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl libcurl4 jq && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -d /home/hostibu -s /bin/bash hostibu

## Security
USER hostibu
ENV USER=hostibu HOME=/home/hostibu
WORKDIR /home/hostibu

## Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/bash", "/run.sh" ]