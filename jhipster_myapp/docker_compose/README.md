# Instruções para baixar e compilar a imagem Docker

## Configurações prévias

Realize as configurações prévias citadas [aqui](../README.md).

# Instruções para baixar e iniciar o Docker Compose

Para instalar o Docker Compose na versão 1.17.0, por exemplo, use os
comandos a seguir.

```sh
sudo su
COMPOSE_VERSION=1.17.0
curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod 777 /usr/local/bin/docker-compose
exit
```

## Inicie os conteiners

Inicie os microserviços com o comando abaixo.

```sh
cd docker_compose/
docker-compose -f docker-compose_jhipster.yml up --build
```

## Acesso ao Gateway

Acesse a interface do Gateway através da URL http://localhost:8084 ou http://IP-DOCKER_HOST:8084.

Acesse a interface do Registry através da URL http://localhost:8761 ou http://IP-DOCKER_HOST:8761.

## Pare os conteiners

Use os comandos a seguir para parar os conteineres.

```sh
cd docker_compose/
docker-compose down
```

Para obter mais informações sobre o Docker Compose acesse:

* [https://docs.docker.com/compose/reference/](https://docs.docker.com/compose/reference/)
* [https://docs.docker.com/compose/compose-file/](https://docs.docker.com/compose/compose-file/)
