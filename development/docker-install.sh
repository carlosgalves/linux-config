#!/bin/sh

log_file="log.txt"

# Check if the log file exists, create it if not
if [ ! -e "$log_file" ]; then
    touch "$log_file"
fi

check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $1" >> "$log_file"
    else
        echo "[FAILURE] $1" >> "$log_file"
    fi
}

echo "Installing docker..."

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo dnf -y install docker-compose
sudo systemctl start docker
sudo systemctl enable docker

#sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
#newgrp docker

#echo
#echo "Docker status:"
#systemctl status docker

if check_installation "Docker"; then
    docker_version=$(docker --version)
    echo "[DOCKER VERSION]: $docker_version" >> "$log_file"
fi