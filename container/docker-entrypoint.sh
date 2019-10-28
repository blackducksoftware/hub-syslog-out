#!/bin/bash
# 

LOGDIR=/var/lib/logstash/data
#CONFIGFILE=/etc/rsyslog.d/send-to-remote.conf

if [ ! -d $LOGDIR ]
then
  echo "Logstash directory $LOGDIR is not found. Exiting."
  exit 1
fi

#LOGFILES=$( find /var/lib/logstash/data/ -name \*\.log | \
#            sed 's/[0-9]\{4\}-[0-9][0-9]-[0-9][0-9]\.log/*.log/' | \
#            sort | uniq )
#
#echo $LOGDIR
#echo "$LOGFILES" | awk -f /usr/local/lib/process.awk \
#                   -v host=$REMOTE_SYSLOG_HOST \
#                   -v port=$REMOTE_SYSLOG_PORT \
#                   -v protocol=$REMOTE_SYSLOG_PROTOCOL \
#                   > $CONFIGFILE


/usr/sbin/rsyslogd -n -i /var/run/rsyslogd/rsyslogd.pid ${LOGSHIPPER_OPTS}


