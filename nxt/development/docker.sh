#!/bin/bash

source helpers/check-installation.sh

dnf update -y

echo "****************************************************************"
echo "Docker installation"
echo "****************************************************************"


echo "Installing docker..."

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker_version=$(docker --version)
check_installation "Docker" "$docker_version"

docker_compose_version=$(docker-compose --version)
check_installation "Docker Compose" "$docker_compose_version"

systemctl start docker
systemctl enable docker