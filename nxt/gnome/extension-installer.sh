#!/bin/bash

# extension manager
flatpak install flathub com.mattjakeman.ExtensionManager -y
# gnome-extensions
dnf -y install gnome-extensions-app
#gnome-tweaks
dnf -y install gnome-tweaks
# adwaita-dark
dnf -y install gnome-themes-extra

dnf update -y

#dependências
dnf install -y curl wget jq

rm -f ./install-gnome-extensions.sh; wget -N -q "https://raw.githubusercontent.com/ToasterUwU/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./install-gnome-extensions.sh && chmod +x install-gnome-extensions.sh

# chmod +x extensions.txt
./install-gnome-extensions.sh --enable --file gnome/extensions.txt

rm install-gnome-extensions.sh