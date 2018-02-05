#!/usr/bin/env bash

set -o errexit
set -o pipefail

/usr/sbin/rsyslogd && /usr/sbin/pdns_server