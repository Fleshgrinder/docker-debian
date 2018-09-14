FROM debian:stretch-slim

COPY bin/ /usr/bin/
ENTRYPOINT ["/usr/bin/entrypoint"]
HEALTHCHECK --interval=10s --timeout=1s CMD ["/usr/bin/healthcheck"]
SHELL ["/bin/bash", "-euxc"]
WORKDIR /srv

RUN apt-install \
        ca-certificates \
        curl \
        dnsutils \
        gettext-base \
        iputils-ping \
        jq \
        mtr \
        netcat-traditional \
        tcpdump \
        telnet \
        tmux \
        traceroute \
 && rm -r /usr/bin/*gettext* /usr/share/java/libintl.jar \
 && adduser --disabled-login --disabled-password --group --no-create-home --quiet --system srv \
 && mkdir -p /usr/local/etc
