# Instruções para baixar e compilar a imagem Docker do Grafana

Baixe o código do repositório Git.

```sh
git clone https://github.com/aeciopires/docker
```

Compile a imagem Docker .

```sh
cd ubuntu-grafana
docker build  -t aeciopires/ubuntu-grafana:v7 .
```

Inicie o contêiner.

```sh
docker run -i -t -p 3000:3000 --name grafana aeciopires/ubuntu-grafana:7.0.4 /bin/bash
```

Caso o Grafana não inicie automaticamente, inicie-o dentro do conteiner.

```sh
service grafana-server start
```

Verifique se o processo do Grafana foi iniciado.

```sh
ps aux | grep grafana
```

Acesso ao serviço

Acesse o serviço no navegador usando as informações abaixo.

* URL: http://localhost:3000 
* Login: admin 
* Password: admin
