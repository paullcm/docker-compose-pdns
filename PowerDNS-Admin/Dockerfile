FROM alpine:edge

MAINTAINER m120

RUN \
		apk --update add git gcc python python-dev py-pip musl-dev mariadb-dev libffi-dev openldap-dev mariadb-client tzdata rsyslog bash

ENV WORK /work
WORKDIR ${WORK}

# git clone
RUN git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git

# pdns-admin install
RUN pip install MySQL-python
RUN pip install -r PowerDNS-Admin/requirements.txt

RUN \
		apk --purge -v del git gcc python-dev py-pip && \
		rm -rf /var/cache/apk/*

# pdns-admin settings
ADD config.py ${WORK}/PowerDNS-Admin/

# pdns run
EXPOSE 9393:9393
