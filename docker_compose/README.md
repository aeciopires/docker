# Instruções para baixar e iniciar o Docker Compose

## Baixe e instale o Docker Compose.

```sh
sudo su
COMPOSE_VERSION=1.15.0
curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod 777 /usr/local/bin/docker-compose
exit
```

## Inicie o conteiner do Grafana usando o Docker Compose

```sh
cd docker_compose/
docker-compose -f docker-compose_grafana.yml up --build
```

## Acesso ao servico

Acesse o serviço através do navegador da sua estação de trabalho, usando as informações abaixo.

URL: http://localhost:3000
Login: admin
Senha: admin

## Pare o conteiner do Grafana usando o Docker Compose

```sh
cd docker_compose/
docker-compose down
```

