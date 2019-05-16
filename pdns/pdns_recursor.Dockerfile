FROM alpine:edge
MAINTAINER m120

ARG PDNS_API_KEY
ARG TIMEZONE
ARG PDNS_RECURSOR_IPADDR

# INSTALL: pkg
RUN apk --update add \
  pdns pdns-recursor bind-tools rsyslog tzdata bash && \
  rm -rf /var/cache/apk/*

# SETTING: Timezone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

# ADD: Configs
ADD conf/recursor.conf /etc/pdns/recursor.conf
RUN sed -i -e "s@_POPOPO_@${PDNS_API_KEY}@g" /etc/pdns/recursor.conf
RUN sed -i -e "s@_PIPIPI_@${PDNS_RECURSOR_IPADDR}@g" /etc/pdns/recursor.conf

ADD conf/forward-zones-file /etc/pdns/forward-zones-file
ADD conf/rsyslog.conf /etc/rsyslog.conf
