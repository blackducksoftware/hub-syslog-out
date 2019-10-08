FROM ubuntu:18.04

RUN apt-get update && apt-get -y install rsyslog && mkdir /var/run/rsyslogd && chown syslog /var/run/rsyslogd && chown -R syslog /etc/rsyslog.d && rm /etc/rsyslog.d/50-default.conf 
COPY rsyslog.conf /etc/rsyslog.conf
COPY process.awk /usr/local/lib/process.awk
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY docker-healthcheck.sh /usr/local/bin/docker-healthcheck.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/docker-entrypoint.sh"]
