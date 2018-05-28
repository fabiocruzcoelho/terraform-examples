#!/bin/bash

#Update repositorio
yum update -y #&& yum install wget && yum install curl && net-tools

#Instalação Pre-Requisitos
while read -r p ; do sudo yum install -y $p ; done < <(cat << "EOF"
    curl
    wget
    vim
    net-tools
    htop
EOF
)

# Instalação Docker
sudo curl -fsSL https://get.docker.com | bash

# Inicia e habilita docker.service
sudo systemctl start docker
sudo systemctl enable docker

# Subir Rancher
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher