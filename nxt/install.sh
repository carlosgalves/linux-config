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

log_file="log.json"

# Check if the log file exists, create it if not
if [ ! -e "$log_file" ]; then
    touch "$log_file"
fi

install_scripts=(
    "fedora/fedora-apps.sh"
    "fedora/config.sh"
    "fedora/media-codecs.sh"
    "gnome/extension-installer.sh"
    "apps/flatpak.sh"
    "apps/postman-fix.sh"
    "apps/vs-code.sh"
    "apps/virtualbox.sh"
    "apps/autGov.sh"
    "apps/firefox/firefox.sh"
    "apps/startup/startup-apps.sh"
    "development/lamp.sh"
    "development/docker.sh"
    "development/python.sh"
    "development/node.sh"
    #"development/rabbit-mq.sh"
)


progress=0
for script in "${install_scripts[@]}"; do
    show_progress $progress ${#install_scripts[@]}
    chmod +x "$script" && bash ./"$script"
    progress=$((progress + 1))
done

echo "Install status:"

# Print table header
printf "%-20s | %-10s | %-20s | %-20s\n" "Application" "Status" "Installed Version" "Latest Release"

# Parse and print each line of the log file as a table row
while IFS= read -r line; do
    name=$(echo "$line" | jq -r '.name')
    status=$(echo "$line" | jq -r '.status')
    installed_version=$(echo "$line" | jq -r '.installed_version')
    latest_release=$(echo "$line" | jq -r '.latest_release')
    printf "%-20s | %-10s | %-20s | %-20s\n" "$name" "$status" "$installed_version" "$latest_release"
done < "$log_file" | column -t -s "|"


#awk '/\[SUCCESS\]/ {gsub(/.*\[SUCCESS\] /, "\033[32m&\033[0m"); print}' "$log_file"
#awk '/\[FAILURE\]/ {gsub(/.*\[FAILURE\] /, "\033[31m&\033[0m"); print}' "$log_file"
