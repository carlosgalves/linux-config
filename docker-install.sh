#!/bin/sh

echo "****************************************************************"
echo "Installing docker..."
echo
echo

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo dnf -y install docker-compose
sudo systemctl start docker
sudo systemctl enable docker

#sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
#newgrp docker

echo
echo "Docker status:"
systemctl status docker
echo "Docker version:"
docker --version 
echo
echo "****************************************************************"