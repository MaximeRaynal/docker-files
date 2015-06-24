FROM ubuntu:latest
MAINTAINER Maxime Raynal <me@maxproject.fr>

RUN         apt-get update && apt-get install -y redis-server

ADD redis.conf /etc/redis/

EXPOSE      6379

ENTRYPOINT  ["/usr/bin/redis-server"]
