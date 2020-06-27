FROM ubuntu:20.04
# Imagem base

# Informacoes sobre a imagem
LABEL maintainer="Aécio Pires" \
      email="http://blog.aeciopires.com/contato/" \
      date_create="09/04/2017" \
      version="1.1.0" \
      description="Especifica a imagem disponível em https://hub.docker.com/r/aeciopires/ubuntu-grafana/" \
      licensce="copyright"

# Declaracao de variaveis
ARG grafana_version="7.0.4"
ARG grafana_package=grafana_${grafana_version}_amd64.deb
ARG grafana_download_url_base="https://dl.grafana.com/oss/release"
ARG grafana_download=${grafana_download_url_base}/${grafana_package}
ARG grafana_port=3000

# Adicionando o script de inicializacao do Grafana
ADD run.sh /opt/run.sh

# Instalando as dependencias e o Grafana
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
    && wget --no-check-certificate ${grafana_download} -O /tmp/${grafana_package} \
    && dpkg -i /tmp/${grafana_package} \
    && service grafana-server restart \
    && grafana-cli plugins install jdbranham-diagram-panel \
    && grafana-cli plugins install briangann-gauge-panel \
    && grafana-cli plugins install alexanderzobnin-zabbix-app \
    && grafana-cli plugins install grafana-clock-panel \
    && grafana-cli plugins install grafana-piechart-panel \
    && chmod +x /opt/*.sh

# Expondo a porta do Grafana
EXPOSE ${grafana_port}

# Executando o script de inicializacao do Grafana
ENTRYPOINT ["/opt/run.sh"]

