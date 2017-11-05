#Imagem base
FROM ubuntu:16.04

#Informacoes sobre a imagem
LABEL autor="Aécio Pires" \
      email="aeciopires@gmail.com" \
      data_criacao="05/11/2017" \
      versao="1.0.0" \
      descricao="Especifica a imagem Docker do my_ubuntu" \
      licenca="copyright"

#Instalando o Java 8 da Oracle
RUN cd /tmp \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install libfontconfig \
                          wget \
                          gosu \
                          ca-certificates \
                          net-tools \
                          vim \
                          apt-utils \
                          git \
                          ntp \
                          ntpdate \
                          tzdata \
                          iputils-ping \
                          python-software-properties \
                          software-properties-common \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && apt-get -y install oracle-java8-installer oracle-java8-set-default \
    && setcap cap_net_bind_service=+ep /usr/lib/jvm/java-8-oracle/bin/java \
    && setcap cap_net_bind_service=+ep /usr/lib/jvm/java-8-oracle/jre/bin/java \
    && apt-get clean

#Copiando o arquivo de configuracao do NTP
ADD ntp.conf /etc/ntp.conf

#Sincronizando a hora com o NTP
RUN ln -sfn /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && export TZ=BRT \
    && dpkg-reconfigure -f noninteractive tzdata \
    && chown root:root /etc/ntp.conf \
    && chmod 744 /etc/ntp.conf \
    && service ntp start
#    && ntpdate -s a.ntp.br \
#    && ntpdate -s b.ntp.br \
#    && ntpdate -s c.ntp.br
