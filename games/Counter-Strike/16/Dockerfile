# Select OS
FROM --platform=$TARGETOS/$TARGETARCH debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

# Configure
LABEL author="Hostibu" maintainer="operasyon@hostibu.com"

# Install Dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        lib32gcc-s1 \
        libc6:i386 \
        libstdc++6:i386 \
        libsdl2-2.0-0:i386 \
        ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Variables
ENV GLIBC_TUNABLES="glibc.rtld.execstack=2"

# Create User
RUN useradd -m -d /home/container -s /bin/bash container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Run script
COPY ./run.sh /run.sh
CMD [ "/bin/bash", "/run.sh" ]