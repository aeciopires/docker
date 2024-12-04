FROM ubuntu:24.04
# Base image

# Informations about this image
LABEL author="Aécio Pires" \
      email="http://blog.aeciopires.com/contato/" \
      last_update="12/04/2024" \
      version="3.0.2" \
      description="Docker image custom of Ubuntu available in https://hub.docker.com/r/aeciopires/my_ubuntu" \
      license="copyright"

# Define software versions
ENV OPENJDK_VERSION='21' \
    GO_VERSION='1.23.4'

# Change sh to bash. Reference: https://github.com/moby/moby/issues/7281
# Only Ubuntu
SHELL ["/usr/bin/bash", "-c"]

# Install packages
RUN <<EOF
cd /tmp
apt update
export DEBIAN_FRONTEND=noninteractive
apt install -y openjdk-${OPENJDK_VERSION}-jdk openjdk-${OPENJDK_VERSION}-jre \
    libfontconfig \
    curl \
    wget \
    gosu \
    ca-certificates \
    net-tools \
    vim \
    apt-utils \
    ntp \
    ntpdate \
    iputils-ping
apt clean
# Install Go
mkdir -p $HOME/go
curl https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz -o go.tar.gz
tar -C /usr/local -xzf go.tar.gz
ln -sfn /usr/local/go/bin/go /usr/local/bin/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
rm go.tar.gz
go version
EOF

# Copying NTP configuration file
ADD ntp.conf /etc/ntp.conf

# Synchronizing the time with NTP
RUN <<EOF
ln -sfn /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
export TZ=BRT
chown root:root /etc/ntp.conf
chmod 744 /etc/ntp.conf
#systemctl restart ntp
#ntpdate -s a.ntp.br
#ntpdate -s b.ntp.br
#ntpdate -s c.ntp.br
EOF

# Infinite loop to keep container run until be stop manually
CMD ["bash","-c","while true; do sleep 30; done;"]
