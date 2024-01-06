#!/bin/sh

sudo dnf remove firefox -y

flatpak install flathub org.mozilla.firefox

# gnome theme
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash