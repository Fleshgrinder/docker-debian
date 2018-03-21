FROM debian:stretch-slim

COPY bin/ /usr/bin/
SHELL ["/bin/bash", "-euxc"]
WORKDIR /usr/local/src

RUN apt-install build-essential ca-certificates curl file git jq make tar gettext-base \
 && rm -r /usr/bin/*gettext* /usr/share/java/libintl.jar \
 && curl-dl -ojfrog 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.14.0%2Fjfrog-cli-linux-amd64%2Fjfrog' \
 && chmod +x jfrog \
 && mv jfrog /usr/local/bin/
