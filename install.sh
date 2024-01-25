#!/bin/bash

log_file="log.txt"

# Check if the log file exists, create it if not
if [ ! -e "$log_file" ]; then
    touch "$log_file"
fi

install_scripts=(
    "fedora/config.sh"
    "fedora/fedora-apps.sh"
    "fedora/media-codecs.sh"
    "gnome/extension-installer.sh"
    #"apps/flatpak.sh"
    "apps/autGov.sh"
    "development/lamp.sh"
    "development/docker.sh"
    "development/node.sh"
    "development/rabbitmq.sh"
)

source "helpers/progress-bar.sh"


progress=0
for script in "${install_scripts[@]}"; do
    show_progress $progress ${#install_scripts[@]}
    sudo chmod +x "$script" && sudo bash ./"$script"
    progress=$((progress + 1))
done


echo "Install status:"
awk '/\[SUCCESS\]/ {gsub(/.*\[SUCCESS\] /, "\033[32m&\033[0m"); print}' "$log_file"
awk '/\[FAILURE\]/ {gsub(/.*\[FAILURE\] /, "\033[31m&\033[0m"); print}' "$log_file"
