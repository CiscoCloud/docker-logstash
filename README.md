# docker-logstash
Docker image with Logstash 1.5 leveraging Alpine Linux

## How to build
```
git clone https://github.com/CiscoCloud/docker-logstash.git
cd docker-logstash
docker build -t ciscocloud/docker-logstash .
```

## How to run
```
docker run --rm -it --name logstash \
  -v $PWD/conf.d:/home/logstash/conf.d \
  ciscocloud/docker-logstash /bin/bash
```

## How to test
```
docker pull ubuntu
docker run --rm -it --link logstash:logstash ubuntu /bin/bash
```
Add to the end of your `rsyslog.conf` `*.* @@<hostname>:5514`
```
service rsyslog restart
exit
```

## Plugins
Logentries plugin is supplied with this image.
