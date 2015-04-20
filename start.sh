#!/bin/bash

LOGSTASH_DIR=/home/logstash
LOGSTASH_CONF=$LOGSTASH_DIR/conf.d/logstash.conf

if [ "$1" == 'logstash' ]; then
    if [ -e "$LOGSTASH_CONF" ]; then
        /usr/bin/redis-server /etc/redis.conf \
        && $LOGSTASH_DIR/bin/logstash -f $LOGSTASH_CONF
    else
        exit 1
    fi
fi

exec "$@"
