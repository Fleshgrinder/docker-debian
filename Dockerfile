FROM golang:1-stretch

ENV GOPATH=/usr/local/src PATH=${GOPATH}:${GOPATH}/bin:${PATH}
COPY bin/ /usr/bin/
SHELL ["/bin/bash", "-euxc"]
WORKDIR ${GOPATH}

RUN apt-install build-essential ca-certificates curl file git jq make tar \
 && mkdir -p "${GOPATH}/bin" "${GOPATH}/src"
