#Imagem base
FROM aeciopires/my_ubuntu:16.04

#Informacoes sobre a imagem
LABEL autor="Aécio Pires" \
      email="aeciopires@gmail.com" \
      data_criacao="05/11/2017" \
      versao="1.0.0" \
      descricao="Especifica a imagem Docker do JHipster-Gateway" \
      licenca="copyright"

#---------------------------------#
# Variaveis usadas no DockerFile
#---------------------------------#
#Variaveis de ambiente (o valor eh alterado na inicializacao do conteiner, se vazia, recebera um valor padrao)
ARG APP_PROFILE
ENV APP_PROFILE ${APP_PROFILE:-prod}

ARG GATEWAY_VERSION
ENV GATEWAY_VERSION ${GATEWAY_VERSION:-0.0.1}

#Variaveis locais
ARG gateway_port=8080
ARG gateway_download_url="http://puppet.aeciopires.com/files/jhipster-sample-application/"
ARG gateway_source_file=jhipster-sample-application-${GATEWAY_VERSION}.war
ARG gateway_app_file=jhipster-gateway.war
ARG gateway_download=$gateway_download_url/$GATEWAY_VERSION/$gateway_source_file
#----------- FIM-VARIAVEIS--------#

#Criando a estrutura de diretorios do Gateway
RUN mkdir -p /home/jhipster/log \
             /home/jhipster/gateway

#Instalando o Gateway
RUN cd /tmp \
    && wget --no-check-certificate ${gateway_download} -O /tmp/${gateway_source_file}

#Movendo o war e atribuindo as permissoes
RUN mv /tmp/${gateway_source_file} /home/jhipster/gateway/${gateway_app_file}

#Copiando o arquivo de configuracao do microservico
ADD application-prod.yml /home/jhipster/gateway/application-prod.yml
ADD bootstrap-prod.yml /home/jhipster/gateway/bootstrap-prod.yml
ADD application-dev.yml /home/jhipster/gateway/application-dev.yml
ADD bootstrap-dev.yml /home/jhipster/gateway/bootstrap-dev.yml

#Definindo as permissoes de acesso
RUN useradd jhipster \
    && chown -R jhipster:jhipster /home/jhipster/ \
    && chmod -R 755 /home/jhipster/

#Copiando arquivos e scripts para dentro da imagem
ADD run.sh /run.sh

#Definindo a permissao do scripts e arquivos
RUN chmod 755 /run.sh \
    && ldconfig 

#Expondo a porta do servico
EXPOSE ${gateway_port}

#Iniciando o servico ao iniciar o conteiner
ENTRYPOINT ["/bin/bash", "-c", "/run.sh $APP_PROFILE"]
