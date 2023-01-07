FROM ubuntu:22.04
# Base image

# Information about the image
LABEL maintainer="Aécio Pires" \
      email="http://blog.aeciopires.com/contato/" \
      date_create="07/01/2023" \
      version="1.2.0" \
      description="Docker image custom of Grafana available in https://hub.docker.com/r/aeciopires/ubuntu-grafana/" \
      licensce="copyright"

# Variables
ARG grafana_version="9.3.2"
ARG grafana_package="grafana_${grafana_version}_amd64.deb"
ARG grafana_download_url_base="https://dl.grafana.com/oss/release"
ARG grafana_download="${grafana_download_url_base}/${grafana_package}"
ARG grafana_port="3000"

# Adding the Grafana Startup Script
ADD run.sh /opt/run.sh

# Installing dependencies and Grafana
RUN apt update \
    && apt -y upgrade \
    && apt install -y --no-install-recommends \
        libfontconfig \
        wget \
        gosu \
        ca-certificates \
        net-tools \
        apt-utils \
        adduser \
    && apt clean \
    && cd /tmp \
    && wget --no-check-certificate ${grafana_download} -O /tmp/${grafana_package} \
    && dpkg -i /tmp/${grafana_package} \
    && update-rc.d grafana-server defaults 95 10 \
    && grafana-cli plugins install jdbranham-diagram-panel \
    && grafana-cli plugins install briangann-gauge-panel \
    && grafana-cli plugins install alexanderzobnin-zabbix-app \
    && grafana-cli plugins install grafana-clock-panel \
    && grafana-cli plugins install digrich-bubblechart-panel \
    && chmod +x /opt/*.sh

# Exposing the Grafana port
EXPOSE ${grafana_port}

# Running the Grafana startup script
ENTRYPOINT ["/opt/run.sh"]
