#----
#     This Dockerfile generate image from repositoriy 
#     https://hub.docker.com/r/aeciopires/ubuntu-grafana/
#----
#Version  0.0.4

FROM ubuntu:16.04

MAINTAINER Aecio Pires http://blog.aeciopires.com
LABEL Description="This image is used to start Grafana"

ADD run.sh /opt/run.sh

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends \
			libfontconfig \
			wget \
			gosu \
			ca-certificates \
			net-tools \
			apt-utils \
    && apt-get clean \
    && cd /tmp \
    && VERSION=4.2.0_amd64 \
    && wget --no-check-certificate https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_$VERSION.deb \
    && dpkg -i grafana_$VERSION.deb \
    && service grafana-server restart \
    && grafana-cli plugins install jdbranham-diagram-panel \
    && grafana-cli plugins install briangann-gauge-panel \
    && grafana-cli plugins install alexanderzobnin-zabbix-app \
    && grafana-cli plugins install grafana-clock-panel \
    && grafana-cli plugins install grafana-piechart-panel \
    && chmod +x /opt/*.sh

#CMD ["/opt/run.sh"]
ENTRYPOINT ["/opt/run.sh"]

EXPOSE 3000
