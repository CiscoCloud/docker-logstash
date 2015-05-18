#!/bin/bash -x

LOGSTASH_HOME="/opt/logstash"
LOGSTASH_CONF="$LOGSTASH_HOME/conf.d/logstash.conf"

if [[ "$1" == "logstash" && -e "$LOGSTASH_CONF" ]]; then
    "$LOGSTASH_HOME/bin/logstash" -f "$LOGSTASH_CONF" || exit 1
    set --
fi

exec "$@"
