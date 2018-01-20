FROM golang:1-stretch

COPY bin/ /usr/bin/
SHELL ["/bin/bash", "-euxc"]
WORKDIR /usr/local/src

RUN apt-install build-essential ca-certificates curl file git jq make tar
