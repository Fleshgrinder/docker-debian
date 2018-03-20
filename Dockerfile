FROM debian:stretch-slim

COPY bin/ /usr/bin/
SHELL ["/bin/bash", "-euxc"]
WORKDIR /usr/local/src

RUN apt-install \
    autoconf \
    automake \
    bison \
    build-essential \
    ca-certificates \
    curl \
    file \
    gettext-base \
    git \
    gnupg \
    jq \
    libbz2-dev \
    libc-ares-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libsodium-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    make \
    pkg-config \
    re2c \
    ssh \
    tar \
    unzip \
    zlib1g-dev \
 && rm -r /usr/bin/*gettext* /usr/share/java/libintl.jar \
 && curl-dl -ojfrog 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.14.0%2Fjfrog-cli-linux-amd64%2Fjfrog' \
 && chmod +x jfrog \
 && mv jfrog /usr/local/bin/
