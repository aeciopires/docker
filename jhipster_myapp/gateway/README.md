# Instruções para baixar e compilar a imagem Docker

## Configurações prévias

Realize as configurações prévias citadas [aqui](../README.md).

## Compile a imagem Docker.

Considerando que você já realizou as configurações prévias, use o
comando a seguir para gerar uma imagem do JHipster-Gateway para uma versão.

```sh
cd jhipster_myapp/gateway
docker build  -t jhipster_myapp/gateway:0.0.1 .
```

## Inicie o conteiner.

Use o comando a seguir para iniciar um conteiner do JHipster-Gateway.

```sh
docker run -d -p 8080:8080 --name jhipster-gateway -e APP_PROFILE="prod" jhipster_myapp/gateway:0.0.1
```

## Visualize o log do microserviço.

```sh
docker logs -f jhipster-gateway
```

## Se precisar remover o conteiner, use o comando abaixo.

```sh
docker rm -f jhipster-gateway
```

Acesse o JHipster-Gateway na URl http://localhost:8080 ou http://IP-DOCKER_HOST:8080
