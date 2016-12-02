#This Dockerfile generate image from repositoriy https://hub.docker.com/r/aeciopires/ubuntu16-04_grafana/
#Version  0.0.1

FROM ubuntu:16.04

MAINTAINER Aecio Pires http://blog.aeciopires.com
LABEL Description="This image is used to start Grafana" Version="3.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
			adduser \
			libfontconfig \
			wget \
			openssh-server \
			net-tools \
			apt-utils \
			vim \
    && apt-get clean \
    && cd /tmp \
    && VERSION=4.0.0-1480439068_amd64 \
    && wget https://grafanarel.s3.amazonaws.com/builds/grafana_$VERSION.deb \
    && dpkg -i grafana_$VERSION.deb \
    && grafana-cli plugins install jdbranham-diagram-panel \
    && grafana-cli plugins install briangann-gauge-panel \
    && grafana-cli plugins install alexanderzobnin-zabbix-app \
    && grafana-cli plugins install grafana-clock-panel \
    && grafana-cli plugins install grafana-piechart-panel

CMD service ssh start \
    && service grafana-server start

EXPOSE 3000

