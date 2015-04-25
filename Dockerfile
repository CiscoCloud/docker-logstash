FROM alpine

# Logstash version
ENV VERSION 1.5.0-rc3

ENV LOGSTASH_HOME /home/logstash
ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk

RUN apk add --update bash openjdk7 redis

RUN wget -P /tmp "http://download.elastic.co/logstash/logstash/logstash-$VERSION.tar.gz" \
    && tar -xzf "/tmp/logstash-$VERSION.tar.gz" -C /tmp \
    && mv "/tmp/logstash-$VERSION" "$LOGSTASH_HOME"

COPY cacerts "$JAVA_HOME"/jre/lib/security/cacerts
COPY plugins/logentries.rb "$LOGSTASH_HOME"/lib/logstash/outputs/
COPY start.sh /usr/local/bin/

VOLUME /docker_logs

ENTRYPOINT ["/usr/local/bin/start.sh"]
