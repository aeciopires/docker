# What is Grafana?

Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. Create, explore, and share beautiful dashboards with your team and foster a data driven culture.

The easiest way to get started is with Grafana Cloud, our fully composable observability stack.

# What's in this image?

* operating system: **Ubuntu 24.04 LTS 64 bits**

* Packages:
  * ca-certificates
  * apt-utils
  * net-tools
  * gosu
  * wget
  * libfontconfig
  * Grafana

View Dockerfile: https://github.com/aeciopires/docker/blob/master/ubuntu-grafana

More information install Grafana: [http://docs.grafana.org/installation/debian/](http://docs.grafana.org/installation/debian/)

# How to access Grafana?

* URL: **http://localhost:3000** or **http://ip-container:3000**
* login: **admin**
* password: **admin**

# Grafana details

* Installs binary to **/usr/sbin/grafana-server**
* Installs Init.d script to **/etc/init.d/grafana-server**
* Creates default file (environment vars) to **/etc/default/grafana-server**
* Installs configuration file to **/etc/grafana/grafana.ini**
* The default configuration sets the log file at **/var/log/grafana/grafana.log**
* The default configuration specifies an sqlite3 db at **/var/lib/grafana/grafana.db**

# How to use image

1) Create a conteiner:

a) In background:

```bash
docker container run -p 3000:3000 -d --rm --name grafana aeciopires/ubuntu-grafana:v11
```

or

b) Interactive:

```bash
docker container run -p 3000:3000 -i -t --rm --name grafana aeciopires/ubuntu-grafana:v11 /bin/bash
```

2) Get logs of container:

```bash
docker container logs -f grafana
```

# How to update the image?

1) Clone the git repository:

```bash
git clone git@github.com:aeciopires/docker.git
cd docker/ubuntu-grafana/
```

2) Generate new image:

```bash
docker image build -t aeciopires/ubuntu-grafana:v11 .
```

3) List images.

```bash
docker image ls
```

4) Send image for https://hub.docker.com:

```bash
docker login -u aeciopires
```

5) Push image:

```bash
docker push aeciopires/ubuntu-grafana:v11
```

6) Commit changes in git repository:

```bash
git add *
git commit -m "MESSAGE"
git push
```

Reference:

* https://docs.docker.com/engine/tutorials/dockerimages/
* https://docs.docker.com/engine/reference/commandline/commit/
* https://www.digitalocean.com/community/tutorials/docker-explained-how-to-create-docker-containers-running-memcached
