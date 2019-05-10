FROM ubuntu:latest
MAINTAINER m120
ARG DJANGO_SU_NAME
ARG DJANGO_SU_EMAIL
ARG DJANGO_SU_PASSWD
ENV SU_NAME=${DJANGO_SU_NAME}
ENV SU_EMAIL=${DJANGO_SU_EMAIL}
ENV SU_PASSWD=${DJANGO_SU_PASSWD}

RUN export DEBIAN_FRONTEND=noninteractive && apt update \
 && apt install -y python-dev python-pip python-mysqldb python-setuptools gcc git uwsgi mysql-client libmariadbclient-dev tzdata bash curl openssl --no-install-recommends \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV WORK /work
WORKDIR ${WORK}

RUN git clone https://github.com/McLive/DjangoPowerDNS.git

RUN pip install --no-cache-dir virtualenv \
 && virtualenv venv \
 && /bin/bash -c 'source ./venv/bin/activate'

ADD ./run.sh ./
RUN chmod +x ./run.sh
RUN sed -i -e "s|__NAME__|${SU_NAME}|g" ./run.sh
RUN sed -i -e "s|__PASSWORD__|${SU_PASSWD}|g" ./run.sh
RUN sed -i -e "s|__EMAIL__|${SU_EMAIL}|g" ./run.sh


ADD ./settings.py DjangoPowerDNS/DjangoPowerDNS/settings.py
RUN export SECRET_KEY=$(cat /proc/sys/kernel/random/uuid) \
 && sed -i -e "s|soome-secret-key--please-change-me-now|${SECRET_KEY}|g" DjangoPowerDNS/DjangoPowerDNS/settings.py

RUN pip install --no-cache-dir -r DjangoPowerDNS/requirements.txt

## Installation: dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN curl -L -o ./dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf ./dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm ./dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

## Clean up
RUN apt remove --purge -y gcc git curl \
 && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
 && rm -rf /root/.cache/

EXPOSE 8053:8053

