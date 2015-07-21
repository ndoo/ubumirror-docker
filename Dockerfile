FROM ubuntu:14.04
MAINTAINER Nick Charlton <nick@nickcharlton.net>

RUN apt-get update && apt-get install -y ubumirror

ADD ubumirror.conf /etc/ubumirror.conf
