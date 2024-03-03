#!/bin/bash

source helpers/check-installation.sh

echo "Installing Node.js..."
dnf -y install nodejs

node_version=$(node --version)
check_installation "Node" "$node_version"