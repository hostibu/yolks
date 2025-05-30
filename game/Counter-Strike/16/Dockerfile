# Select OS
FROM --platform=$TARGETOS/$TARGETARCH debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive

# Configure
LABEL author="hostibu" maintainer="operasyon@hostibu.com"

# Install Packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y lib32gcc-s1 && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m -d /home/hostibu hostibu

# Security
USER hostibu
ENV USER=hostibu HOME=/home/hostibu
WORKDIR /home/hostibu

# Commands
RUN mkdir -p /home/hostibu/.steam/sdk32
    curl -s -o /home/hostibu/.steam/sdk32/steamclient.so https://hostibu.tr/files/pterodactly/nests/counter-strike/16/steamclient.so && \
    chmod +x /home/hostibu/.steam/sdk32steamclient.so

# Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/sh", "/run.sh" ]
