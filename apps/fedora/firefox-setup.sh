#!/bin/sh

log_file="log.txt"

check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $2" >> "$log_file"
    else
        echo "[FAILURE] $2" >> "$log_file"
    fi
}

echo "Installing Firefox..."

sudo dnf remove firefox -y

flatpak install flathub org.mozilla.firefox -y

# gnome theme
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

check_installation org.mozilla.firefox "Firefox"
