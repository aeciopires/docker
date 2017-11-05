# Instruções para baixar e compilar as imagens Docker do JHipster

## Obtendo o código fonte

Baixe o código do repositório Git com o comando a seguir.

```sh
git clone https://github.com/aeciopires/docker
cd jhipster_myapp
```

## Configurações prévias a compilação das imagens

* Quando a equipe de desenvolvimento gerar uma nova versão de um
microserviço, é necessário que o arquivo ``Dockerfile``, relacionado ao
serviço, seja alterado para dar suporte as novas dependências de
software ou configuração. Neste mesmo arquivo, também deve ser alterada
a **variável que contém versão**. Exemplo:

Antes:

```sh
ARG GATEWAY_VERSION="1.0.0"
```

Depois:

```sh
ARG GATEWAY_VERSION="1.1.0"
```


* Antes de compilar as imagens dos microserviços, edite os arquivos
``application.yml`` e/ou ``bootstrap.yml`` de cada microserviço e
ajuste os parâmetros de acordo com o ambiente.

* Para cada microserviço funcionar, é necessário que o Registry esteja
em execução.

## Requisitos para executar os conteineres

* No ambiente de desenvolvimento, instale o MySQL com os comandos a seguir.

No Ubuntu 16.04:

```sh
docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root_mysql -e MYSQL_DATABASE=gateway -e MYSQL_USER=jhipster -e MYSQL_PASSWORD=jhipster mysql
```

* É necessário a criação do seguinte banco de dados.

Configuração dos bancos de dados a serem criados.

| Serviço    | Banco            | Usuário          | Senha            |
| ---------- | ---------------- | ---------------- | ---------------- |
| Gateway    | gateway       | jhipster       | jhipster       |

* Siga as instruções [daqui](docker_compose/README.md) para subir todos os conteineres do Jhipster com o Docker Compose.
