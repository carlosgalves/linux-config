#!/bin/bash

# Check if script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit
fi

# Loop to maintain sudo privileges
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &

# Store the PID of the background sudo loop
sudo_loop_pid=$!


source "helpers/progress-bar.sh"


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
    "apps/flatpak.sh"
    "apps/postman-fix.sh"
    "apps/vs-code.sh"
    "apps/autGov.sh"
    "development/lamp.sh"
    "development/docker.sh"
    "development/node.sh"
    "development/rabbit-mq.sh"
)



progress=0
for script in "${install_scripts[@]}"; do
    show_progress $progress ${#install_scripts[@]}
    chmod +x "$script" && bash ./"$script"
    progress=$((progress + 1))
done


echo "Install status:"
awk '/\[SUCCESS\]/ {gsub(/.*\[SUCCESS\] /, "\033[32m&\033[0m"); print}' "$log_file"
awk '/\[FAILURE\]/ {gsub(/.*\[FAILURE\] /, "\033[31m&\033[0m"); print}' "$log_file"
