#!/bin/bash

log_file="log.txt"

dnf update -y

echo "****************************************************************"
echo "Docker installation"
echo "****************************************************************"


echo "Installing docker..."

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
if dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; then
    docker_version=$(docker --version)
    echo "[SUCCESS] $docker_version" >> "$log_file"
    
    if dnf -y install docker-compose; then
        docker_compose_version=$(docker-compose --version)
        echo "[SUCCESS] $docker_compose_version" >> "$log_file"
    else
        echo "[FAILURE] Docker Compose" >> "$log_file"
    fi

    systemctl start docker
    systemctl enable docker
    
else
    echo "[FAILURE] Docker" >> "$log_file"
fi