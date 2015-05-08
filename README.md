# docker-logstash
Docker image with Logstash 1.5

## How to build
```
git clone https://github.com/CiscoCloud/docker-logstash.git
cd docker-logstash
docker build -t ciscocloud/docker-logstash .
```

## How to run
```
docker run --rm -it --name logstash \
  -v $PWD/conf.d:/opt/logstash/conf.d \
  ciscocloud/docker-logstash
```

## How to test
```
docker pull ubuntu
docker run --rm -it --link logstash:logstash ubuntu /bin/bash
```
Add to the end of your `rsyslog.conf`:

`*.* @@<hostname>:5514`
```
service rsyslog restart
exit
```

## Plugins
[Logentries](https://logentries.com) and [WebHDFS](https://github.com/dstore-dbap/logstash-webhdfs) plugins are supplied with this image.
