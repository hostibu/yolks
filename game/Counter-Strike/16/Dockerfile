## Select OS
FROM --platform=$TARGETOS/$TARGETARCH alpine:latest

## Configure
LABEL author="hostibu" maintainer="operasyon@hostibu.com"

## Commands
RUN apk update && \
    apk upgrade --available && \
    apk add --no-cache wget unzip \
    && rm -rf /var/cache/apk/* \
    && adduser -D -h /home/hostibu -s /bin/bash hostibu

## Security
USER hostibu
ENV USER=hostibu HOME=/home/hostibu
WORKDIR /home/hostibu

## Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/sh", "/run.sh" ]