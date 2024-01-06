#!/bin/bash

## gnome ##
# extension manager
flatpak install flathub com.mattjakeman.ExtensionManager
# gnome-extensions
sudo dnf -y install gnome-tweaks
#gnome-tweaks
sudo dnf -y install gnome-tweaks
# adwaita-dark
sudo dnf -y install gnome-themes-extra

sudo dnf update -y

sudo dnf install -y curl wget jq

rm -f ./install-gnome-extensions.sh; wget -N -q "https://raw.githubusercontent.com/ToasterUwU/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./install-gnome-extensions.sh && chmod +x install-gnome-extensions.sh

./install-gnome-extensions.sh --enable --file extensions.txt