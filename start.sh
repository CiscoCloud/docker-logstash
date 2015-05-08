#!/bin/bash -x

LOGSTASH_HOME='/opt/logstash'
LOGSTASH_CONF="$LOGSTASH_HOME/conf.d/logstash.conf"
LOGSTASH_ENTRYPOINT_CMD='logstash'

if [ "$1" == "$LOGSTASH_ENTRYPOINT_CMD" ]; then
    if [ -e "$LOGSTASH_CONF" ]; then
        "$LOGSTASH_HOME"/bin/logstash -f $LOGSTASH_CONF
        if [ $? != 0 ]; then
            exit 1
        fi
    else
        exit 1
    fi
fi

exec "$@"
