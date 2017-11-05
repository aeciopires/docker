#Imagem base
FROM aeciopires/my_ubuntu:16.04

#Informacoes sobre a imagem
LABEL autor="Aécio Pires" \
      email="aeciopires@gmail.com" \
      data_criacao="05/11/2017" \
      versao="1.0.0" \
      descricao="Especifica a imagem Docker do JHipster-Registry" \
      licenca="copyright"

#---------------------------------#
# Variaveis usadas no DockerFile
#---------------------------------#
#Variaveis de ambiente (o valor eh alterado na inicializacao do conteiner, se vazia, recebera um valor padrao)
ARG APP_PROFILE
ENV APP_PROFILE ${APP_PROFILE:-prod}

ARG REGISTRY_VERSION
ENV REGISTRY_VERSION ${REGISTRY_VERSION:-3.2.3}

#Variaveis locais
ARG registry_port=8761
ARG registry_download_url="https://github.com/jhipster/jhipster-registry/releases/download"
ARG registry_source_file=jhipster-registry-$REGISTRY_VERSION.war
ARG registry_app_file=registry-service.war
ARG registry_download=$registry_download_url/v$REGISTRY_VERSION/$registry_source_file
#----------- FIM-VARIAVEIS--------#

#Criando a estrutura de diretorios do Registry
RUN mkdir -p /home/jhipster/log \
             /home/jhipster/registry

#Baixando o Registry
RUN cd /tmp \
    && wget --no-check-certificate ${registry_download} -O /tmp/${registry_source_file}

#Instalando o Registry
RUN mv /tmp/${registry_source_file} /home/jhipster/registry/${registry_app_file}

#Copiando o arquivo de configuracao do microservico
ADD application-prod.yml /home/jhipster/registry/application-prod.yml
ADD application-dev.yml /home/jhipster/registry/application-dev.yml

#Atribuindo as permissoes de acesso
RUN useradd jhipster \
    && chown -R jhipster:jhipster /home/jhipster/ \
    && chmod -R 755 /home/jhipster/

#Copiando arquivos e scripts para dentro da imagem
ADD run.sh /run.sh

#Definindo a permissao do scripts e arquivos
RUN chown root:root /run.sh \
    && chmod 755 /run.sh \
    && ldconfig

#Ignorando a verificacao do certificado
ADD gitconfig /home/jhipster/.gitconfig
RUN chown -R jhipster:jhipster /home/jhipster/ \
    && chmod -R 755 /home/jhipster/

#Expondo a porta do servico
EXPOSE ${registry_port}

#Iniciando o servico ao iniciar o conteiner
ENTRYPOINT ["/bin/bash", "-c", "/run.sh $APP_PROFILE"]
