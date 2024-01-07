#!/bin/sh

steps=9

progress=0
show_progress() {
    local current=$1
    local total=$2
    local progress_percent=$((current * 100 / total))
    printf "\r\033[34mProgress %d/%d [\033[36m%-20s\033[34m] %d%%\033[0m\n" "$current" "$total" $(printf '#%.0s' $(seq 1 $((progress_percent / 5)))) "$progress_percent"
}


# firefox
show_progress $progress $steps
sudo chmod +x apps/fedora/firefox-setup.sh && sudo ./apps/fedora/firefox-setup.sh
progress=$((progress + 1))

# flatpak
show_progress $progress $steps
sudo chmod +x apps/flatpak-apps.sh && sudo ./apps/flatpak-apps.sh
progress=$((progress + 1))

show_progress $progress $steps
sudo chmod +x apps/authGov.sh && sudo ./apps/authGov.sh
progress=$((progress + 1))

# fedora
show_progress $progress $steps
sudo chmod +x apps/fedora/fedora-packages.sh && sudo ./apps/fedora/fedora-packages.sh
progress=$((progress + 1))

show_progress $progress $steps
sudo chmod +x apps/fedora/fedora-apps.sh && sudo ./apps/fedora/fedora-apps.sh
progress=$((progress + 1))

# gnome extensions
show_progress $progress $steps
sudo chmod +x gnome/extensions/extension-installer.sh && sudo ./gnome/extensions/extension-installer.sh
progress=$((progress + 1))

# development
show_progress $progress $steps
sudo chmod +x development/lamp.sh && sudo ./development/lamp.sh
progress=$((progress + 1))

show_progress $progress $steps
sudo chmod +x development/docker-install.sh && sudo ./development/docker-install.sh
progress=$((progress + 1))

show_progress $progress $steps
sudo chmod +x development/rabbitmq-installer.sh && sudo ./development/rabbitmq-installer.sh
progress=$((progress + 1))



log_file="log.txt"

echo "Install status:"
awk '/\[SUCCESS\]/ {gsub(/.*\[SUCCESS\] /, "\033[32m&\033[0m"); print}' "$log_file"
awk '/\[FAILURE\]/ {gsub(/.*\[FAILURE\] /, "\033[31m&\033[0m"); print}' "$log_file"

echo
echo "Falta: " 
echo " - correr mysql_secure_installation"
echo " - instalar toolbox"
echo " - instalar virtualbox"
