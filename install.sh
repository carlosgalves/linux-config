#!/bin/bash

log_file="log.txt"

# Check if the log file exists, create it if not
if [ ! -e "$log_file" ]; then
    touch "$log_file"
fi

install_scripts=(
    "apps/fedora/firefox-setup.sh"
    "apps/flatpak-apps.sh"
    "apps/authGov.sh"
    "apps/fedora/fedora-packages.sh"
    "apps/fedora/fedora-apps.sh"
    "gnome/extensions/extension-installer.sh"
    "development/lamp.sh"
    "development/docker-install.sh"
    "development/rabbitmq-installer.sh"
)

show_progress() {
    local current=$1
    local total=$2
    local progress_percent=$((current * 100 / total))
    printf "\r\033[34mProgress %d/%d [\033[36m%-20s\033[34m] %d%%\033[0m\n" "$current" "$total" $(printf '#%.0s' $(seq 1 $((progress_percent / 5)))) "$progress_percent"
}


progress=0
for script in "${install_scripts[@]}"; do
    show_progress $progress ${#install_scripts[@]}
    sudo chmod +x "$script" && sudo ./"$script"
    progress=$((progress + 1))
done


echo "Install status:"
awk '/\[SUCCESS\]/ {gsub(/.*\[SUCCESS\] /, "\033[32m&\033[0m"); print}' "$log_file"
awk '/\[FAILURE\]/ {gsub(/.*\[FAILURE\] /, "\033[31m&\033[0m"); print}' "$log_file"

echo
echo "Falta: " 
echo " - correr mysql_secure_installation"
echo " - instalar toolbox"
echo " - instalar virtualbox"
