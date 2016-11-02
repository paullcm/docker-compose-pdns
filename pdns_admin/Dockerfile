## memo
# https://github.com/ngoduykhanh/PowerDNS-Admin

FROM alpine:edge

RUN apk --update add git curl python python-dev musl-dev mariadb-dev libffi-dev openldap-dev gcc mariadb-client tzdata rsyslog bash && \
rm -rf /var/cache/apk/*

ENV WORK /work
WORKDIR ${WORK}


# git clone
#RUN install -m 0600 -d ~/.ssh/
RUN git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git

# pdns-admin install
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN pip install MySQL-python
RUN pip install -r PowerDNS-Admin/requirements.txt

# pdns-admin settings
ADD config.py ${WORK}/PowerDNS-Admin/
#RUN ${WORK}/PowerDNS-Admin/create_db.py

# pdns run
ADD boot.sh ${WORK}/
ADD pdns_admin.sql ${WORK}/
EXPOSE 9393:9393
#CMD ${WORK}/PowerDNS-Admin/run.py
CMD bash ${WORK}/boot.sh

## Todo
# build時に使用したdev系パッケージは消す