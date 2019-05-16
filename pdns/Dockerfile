FROM alpine:edge
MAINTAINER m120
ARG MYSQL_ROOT_PASSWORD
ENV AIUEO=${MYSQL_ROOT_PASSWORD}

# INSTALL: pkg
RUN apk --update add \
  pdns pdns-backend-mysql bind-tools mariadb-client rsyslog tzdata bash && \
  rm -rf /var/cache/apk/*

# SETTING: TZ JST
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ADD: Configs
ADD conf/pdns.conf /etc/pdns/pdns.conf
RUN sed -i -e "s@_MINTIA_BREEZE_@${AIUEO}@g" /etc/pdns/pdns.conf

ADD conf/rsyslog.conf /etc/rsyslog.conf