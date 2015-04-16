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
docker run -it --name central-logstash \
  -v $PWD/logstash.conf:/home/logstash/logstash.conf \
  ciscocloud/docker-logstash /bin/bash
bash-4.3# start_services.sh
```

## How to test
```
docker pull ubuntu
docker run -it --link central-logstash:central ubuntu /bin/bash
```
Add to the end of your `rsyslog.conf` `*.* @@<hostname>:5514`
```
service rsyslog restart
exit
```
