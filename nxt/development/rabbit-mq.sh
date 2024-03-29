#!/bin/bash

source helpers/check-installation.sh

echo "Installing RabbitMQ..."

## primary RabbitMQ signing key
rpm --import 'https://github.com/rabbitmq/signing-keys/releases/download/3.0/rabbitmq-release-signing-key.asc'
## modern Erlang repository
rpm --import 'https://github.com/rabbitmq/signing-keys/releases/download/3.0/cloudsmith.rabbitmq-erlang.E495BB49CC4BBE5B.key'
## RabbitMQ server repository
rpm --import 'https://github.com/rabbitmq/signing-keys/releases/download/3.0/cloudsmith.rabbitmq-server.9F4587F226208342.key'

# erlang
sudo dnf -y install erlang
check_installation "Erlang"

# rabbitmq
dnf -y install rabbitmq-server
version=$(sudo rabbitmqctl version)
check_installation "RabbitMQ" "$version"

#systemctl enable rabbitmq-server
systemctl start rabbitmq-server