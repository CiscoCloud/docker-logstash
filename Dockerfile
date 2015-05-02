FROM jeanblanchard/busybox-java

# Logstash version
ENV VERSION 1.5.0-rc3
ENV LOGSTASH_HOME /opt/logstash

RUN adduser -s /bin/sh -S logstash

RUN opkg-install bash vim

RUN curl "http://download.elastic.co/logstash/logstash/logstash-$VERSION.tar.gz" \
        | gunzip -c - | tar -xf - -C /opt && \
        mv "/opt/logstash-$VERSION" "$LOGSTASH_HOME" && \
        mkdir "$LOGSTASH_HOME"/conf.d

RUN mkdir -p /usr/local/bin

COPY conf.d/* "$LOGSTASH_HOME"/conf.d/
COPY plugins/logentries.rb "$LOGSTASH_HOME"/lib/logstash/outputs/
COPY start.sh /usr/local/bin/

VOLUME /docker_logs

ENTRYPOINT ["/usr/local/bin/start.sh"]

CMD ["logstash"]
