FROM alpine

# Logstash version
ENV VERSION 1.5.0.rc2
ENV LOGSTASH_HOME /home/logstash

RUN apk add --update bash openjdk7 redis

RUN wget -P /tmp "http://download.elastic.co/logstash/logstash/logstash-$VERSION.tar.gz" \
    && tar -xzf "/tmp/logstash-$VERSION.tar.gz" -C /tmp \
    && mv "/tmp/logstash-$VERSION" "$LOGSTASH_HOME"

COPY plugins/logentries.rb "$LOGSTASH_HOME"/lib/logstash/outputs/
COPY start.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start.sh"]
