#!/bin/sh -x

LOGSTASH_DIR=/home/logstash

/usr/bin/redis-server /etc/redis.conf \
&& $LOGSTASH_DIR/bin/logstash --debug -f $LOGSTASH_DIR/logstash.conf
