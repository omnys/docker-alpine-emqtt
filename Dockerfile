FROM omnys/alpine-earlang:latest

MAINTAINER Omnys srl <sistemi@omnys.com>

ENV EMQTTD_VERSION=2.0

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk --no-cache add \
      git \
      make \
      perl \
    && git clone https://github.com/emqtt/emqttd-relx.git /emqttd \
    && cd /emqttd \
    && make \
    && mkdir /opt \
    && mv /emqttd/_rel/emqttd /opt/emqttd \
    && cd / \
    && rm -rf /emqttd \
    && apk --purge del \
        git \
        make \
        perl \
    && rm -rf /var/cache/apk/*
