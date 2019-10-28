FROM ubuntu:18.04

RUN apt-get update && apt-get -y install rsyslog && mkdir /var/run/rsyslogd && rm /etc/rsyslog.d/50-default.conf 
#&& groupadd -g 1003110101 logshipper && useradd -u 1003110101 -g 1003110101 -s /usr/sbin/nologin logshipper
ADD --chown=root:root etc/passwd /etc/passwd
ADD --chown=root:root etc/group /etc/group
ADD --chown=root:shadow etc/shadow /etc/shadow
ADD --chown=root:shadow etc/gshadow /etc/gshadow
RUN chown logshipper /var/run/rsyslogd && chown logshipper /var/spool/rsyslog

COPY rsyslog.conf /etc/rsyslog.conf
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY docker-healthcheck.sh /usr/local/bin/docker-healthcheck.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/docker-entrypoint.sh"]
