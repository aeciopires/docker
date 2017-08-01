#Imagem base
FROM ubuntu:16.04

#Informacoes sobre a imagem
LABEL mantenedor="Aécio Pires" \
      autor="Aécio Pires" \
      email="http://blog.aeciopires.com/contato/" \
      data_criacao="09/04/2017" \
      versao="1.0.0" \
      descricao="Especifica a imagem disponivel em https://hub.docker.com/r/aeciopires/ubuntu-grafana/" \
      licenca="copyright"

#Declaracao de variaveis
ARG grafana_version="4.4.2"
ARG grafana_package=grafana_${grafana_version}_amd64.deb
ARG grafana_download_url_base="https://s3-us-west-2.amazonaws.com/grafana-releases/release"
ARG grafana_download=${grafana_download_url_base}/${grafana_package}
ARG grafana_port=3000

#Adicionando o script de inicializacao do Grafana
ADD run.sh /opt/run.sh

#Instalando as dependencias e o Grafana
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

#Expondo a porta do Grafana
EXPOSE ${grafana_port}

#Executando o script de inicializacao do Grafana
ENTRYPOINT ["/opt/run.sh"]

