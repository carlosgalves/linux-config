#!/bin/bash

log_file="log.txt"

source helpers/check-installation.sh

dnf -y update

echo "Installing Fedora Apps..."

# speedtest-cli
echo "Installing speedtest-cli..."
dnf install -y python
dnf install -y speedtest-cli
check_installation "speedtest-cli"

# webapps
echo "Installing webapp manager..."
dnf copr enable refi64/webapp-manager -y
dnf -y install webapp-manager
check_installation "webapps"

# scr-cpy
dnf copr enable zeno/scrcpy -y && dnf install -y scrcpy
check_installation "scr-cpy"

# virtualbox
sudo dnf -y install https://download.virtualbox.org/virtualbox/7.0.14/VirtualBox-7.0-7.0.14_161095_fedora36-1.x86_64.rpm
check_installation "VirtualBox"

#  jetbrains toolbox
wget -O jetbrains-toolbox "https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux"
tar -xzf jetbrains-toolbox.tar.gz -o toolbox

