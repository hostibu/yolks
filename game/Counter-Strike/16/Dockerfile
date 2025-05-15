## Select OS
FROM ubuntu:18.04

## Configure
LABEL author="hostibu" maintainer="operasyon@hostibu.com"

# Terminal
ENV DEBIAN_FRONTEND=noninteractive

## Commands
RUN apt update && \
    apt upgrade -y && \
    apt install -y wget unzip lib32gcc1 libsdl2-2.0-0 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -d /home/hostibu -s /bin/bash hostibu

## Security
USER hostibu
ENV USER=hostibu HOME=/home/hostibu
WORKDIR /home/hostibu

## Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/bash", "/run.sh" ]