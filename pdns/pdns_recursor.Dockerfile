FROM alpine:edge
MAINTAINER m120

# INSTALL: pkg
RUN apk --update add \
  pdns pdns-recursor bind-tools rsyslog tzdata bash && \
  rm -rf /var/cache/apk/*

# SETTING: TZ JST
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ADD: Configs
ADD conf/recursor.conf /etc/pdns/recursor.conf
ADD conf/forward-zones-file /etc/pdns/forward-zones-file

ADD conf/rsyslog.conf /etc/rsyslog.conf
