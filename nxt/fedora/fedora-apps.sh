#!/bin/bash

log_file="log.txt"

source helpers/check-installation.sh

sudo dnf -y update

echo "Installing Fedora Apps..."

# speedtest-cli
echo "Installing speedtest-cli..."
sudo dnf install -y python
sudo dnf install -y speedtest-cli
check_installation "speedtest-cli"

# webapps
echo "Installing webapp manager..."
sudo dnf copr enable refi64/webapp-manager -y
sudo dnf -y install webapp-manager
check_installation "webapps"

# scr-cpy
dnf copr enable zeno/scrcpy -y && dnf install -y scrcpy
check_installation "scr-cpy"