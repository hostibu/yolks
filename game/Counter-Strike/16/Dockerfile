## Select OS
FROM alpine:latest

## Configure
LABEL author="hostibu" maintainer="operasyon@hostibu.com"

## Commands
RUN apk update && \
    apk upgrade --available && \
    apk add --no-cache wget unzip lib32-glibc libsdl2 \
    && rm -rf /var/cache/apk/* \
    && adduser -D -h /home/hostibu -s /bin/bash hostibu

## Security
USER hostibu
ENV USER=hostibu HOME=/home/hostibu
WORKDIR /home/hostibu

## Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/sh", "/run.sh" ]