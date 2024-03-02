#!/bin/bash

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

# jetbrains toolbox
mkdir toolbox
wget -O jetbrains-toolbox "https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.2.2.20062.tar.gz"
tar -xzf jetbrains-toolbox -C toolbox --strip-components=1
cd toolbox
sudo ./jetbrains-toolbox
check_installation "jetbrains-toolbox"
sudo rm jetbrains-toolbox
sudo rm -rf toolbox

# kathara
wget -O kathara "https://github.com/KatharaFramework/Kathara/releases/download/3.7.1/kathara-3.7.1-1.fc38.x86_64.rpm"
sudo dnf -y install kathara
sudo rm kathara
## dependências: xterm
sudo dnf -y install xterm