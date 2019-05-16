FROM alpine:edge
MAINTAINER m120

ARG MYSQL_ROOT_PASSWORD
ARG PDNS_API_KEY
ARG TIMEZONE

# INSTALL: pkg
RUN apk --update add \
  pdns pdns-backend-mysql bind-tools mariadb-client rsyslog tzdata bash && \
  rm -rf /var/cache/apk/*

# SETTING: Timezone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

# ADD: Configs
ADD conf/pdns.conf /etc/pdns/pdns.conf
RUN sed -i -e "s@_MINTIA_BREEZE_@${MYSQL_ROOT_PASSWORD}@g" /etc/pdns/pdns.conf
RUN sed -i -e "s@_POPOPO_@${PDNS_API_KEY}@g" /etc/pdns/pdns.conf

ADD conf/rsyslog.conf /etc/rsyslog.conf