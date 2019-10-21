FROM ubuntu:18.04

RUN apt-get update && apt-get -y install apt-utils && DEBIAN_FRONTEND=noninteractive apt-get -y install rsyslog && groupadd -g 1003110101 logshipper && useradd -u 1003110101 -g 1003110101 -s /usr/sbin/nologin logshipper && mkdir /var/run/rsyslogd && chown logshipper /var/run/rsyslogd && chown -R logshipper /etc/rsyslog.d && rm /etc/rsyslog.d/50-default.conf 
COPY rsyslog.conf /etc/rsyslog.conf
COPY process.awk /usr/local/lib/process.awk
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY docker-healthcheck.sh /usr/local/bin/docker-healthcheck.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/docker-entrypoint.sh"]
