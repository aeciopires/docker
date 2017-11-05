# Instruções para baixar e compilar a imagem Docker

## Configurações prévias

Realize as configurações prévias citadas [aqui](../README.md).

## Compile a imagem Docker.

1. Considerando que você já realizou as configurações prévias, use o
comando a seguir para gerar uma imagem do Registry para uma versão.

```sh
cd jhipster-myapp/registry
docker build  -t jhipster-myapp/registry:3.2.3 .
```

## Inicie o conteiner.

Use o comando a seguir para iniciar um conteiner do Registry.

```sh
docker run -d -p 8761:8761 --name jhipster-registry -e APP_PROFILE="prod" jhipster-myapp/registry:3.2.3
```

## Visualize o log do microserviço.

```sh
docker logs -f jhipster-registry
```


## Se precisar remover o conteiner, use o comando abaixo.

```sh
docker rm -f jhipster-registry
```

## Acesso ao Registry

Acesse o microserviço através da URL http://localhost:8761 ou http://IP-DOCKER-HOST:8761.
