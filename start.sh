#!/bin/bash -x

LOGSTASH_DIR=/opt/logstash
LOGSTASH_CONF=$LOGSTASH_DIR/conf.d/logstash.conf

if [ "$1" == 'logstash' ]; then
    if [ -e "$LOGSTASH_CONF" ]; then
        $LOGSTASH_DIR/bin/logstash -f $LOGSTASH_CONF
        if [ $? != 0 ]; then
            exit 1
        fi
    else
        exit 1
    fi
fi

exec "$@"
