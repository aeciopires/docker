# Informações sobre a imagem do My_Ubuntu no DockerHub

A imagem está disponível na URL a seguir.

https://hub.docker.com/r/aeciopires/my_ubuntu/

O My_Ubuntu é o Ubuntu customizado a partir da imagem base da versão 24.04.

A imagem providencia os seguintes pacotes.

* openjdk
* golang
* vim
* nano
* wget
* NTP Client
* ping
* curl

## Como usar a imagem?

* Crie um contêiner com uma das formas abaixo.

a) contêiner em background:

```sh
docker container run -d --name=my_ubuntu aeciopires/my_ubuntu:24.04
```

b) contêiner interativo:

```sh
docker container run -i -t --name=my_ubuntu aeciopires/my_ubuntu:24.04
```

## Compile a imagem Docker a partir do DockerFile.

* Baixe o código do repositório Git.

```sh
git clone https://github.com/aeciopires/docker
```

```sh
cd docker/my_ubuntu/
docker build -t aeciopires/my_ubuntu:24.04 .
```

## Referências:

https://docs.docker.com/engine/tutorials/dockerimages/

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

https://docs.docker.com/engine/reference/commandline/commit/

https://www.digitalocean.com/community/tutorials/docker-explained-how-to-create-docker-containers-running-memcached
