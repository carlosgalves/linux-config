#!/bin/bash

# extension manager
flatpak install flathub com.mattjakeman.ExtensionManager -y
# gnome-extensions
sudo dnf -y install gnome-tweaks
#gnome-tweaks
sudo dnf -y install gnome-tweaks
# adwaita-dark
sudo dnf -y install gnome-themes-extra


sudo dnf update -y

sudo dnf install -y curl wget jq

rm -f ./install-gnome-extensions.sh; wget -N -q "https://raw.githubusercontent.com/ToasterUwU/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./install-gnome-extensions.sh && chmod +x install-gnome-extensions.sh

sudo chmod +x gnome/extensions/extensions.txt
./install-gnome-extensions.sh --enable --file gnome/extensions/extensions.txt

sudo rm install-gnome-extensions.sh