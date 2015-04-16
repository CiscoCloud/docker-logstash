FROM alpine

# Logstash version
ENV VERSION 1.5.0.rc2

RUN apk add --update bash openjdk7 redis

RUN wget -P /tmp "http://download.elastic.co/logstash/logstash/logstash-$VERSION.tar.gz" \
    && tar -xzf "/tmp/logstash-$VERSION.tar.gz" -C /tmp \
    && mv "/tmp/logstash-$VERSION" /home/logstash

COPY start_services.sh /usr/local/bin/
