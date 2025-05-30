# Select OS
FROM --platform=$TARGETOS/$TARGETARCH debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive

# Configure
LABEL author="hostibu" maintainer="operasyon@hostibu.com"

# Install Packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y lib32gcc-s1 libc6-i386 lib32z1 lib32stdc++6 && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m -d /home/hostibu hostibu

# Security
USER hostibu
ENV USER=hostibu HOME=/home/hostibu
WORKDIR /home/hostibu

# Run commands
COPY ./run.sh /run.sh
CMD [ "/bin/sh", "/run.sh" ]
