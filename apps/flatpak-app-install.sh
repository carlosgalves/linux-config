#!/bin/bash

log_file="log.txt"

# Variables to store installation status
success_apps=""
failed_apps=""
total_apps=22

apps_to_install="
    org.onlyoffice.desktopeditors
    org.mozilla.Thunderbird
    io.github.alainm23.planify
    com.getpostman.Postman
    io.podman_desktop.PodmanDesktop
    org.kde.krita
    com.github.IsmaelMartinez.teams_for_linux
    com.discordapp.Discord
    org.signal.Signal
    com.ktechpit.whatsie
    com.slack.Slack
    com.valvesoftware.Steam
    com.stremio.Stremio
    com.spotify.Client
    com.usebottles.bottles
    org.remmina.Remmina
    org.keepassxc.KeePassXC
    com.raggesilver.BlackBox
    io.github.flattool.Warehouse
    net.nokyan.Resources
    pteid-mw-linux.x86_64.flatpak
    org.nickvision.money
"

# Function to check installation status and retry if unsuccessful
check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $1" >> "$log_file"
        success_apps="$success_apps$1, "
    else
        echo "[FAILURE] $1" >> "$log_file"
        echo "Retrying installation for $1..."
        flatpak install --reinstall -y $2
        if [ $? -eq 0 ]; then
            echo "[SUCCESS (after retry)] $1" >> "$log_file"
            success_apps="$success_apps$1 (after retry), "
        else
            echo "[FAILURE (after retry)] $1" >> "$log_file"
            failed_apps="$failed_apps$1, "
        fi
    fi
}

show_progress() {
    local current=$1
    local total=$2
    local progress_percent=$((current * 100 / total))
    printf "\r\033[34mProgress %d/%d [\033[36m%-20s\033[34m] %d%%\033[0m\n" "$current" "$total" $(printf '#%.0s' $(seq 1 $((progress_percent / 5)))) "$progress_percent"
}


# Display information about adding Flathub repository
echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub repository added successfully!"

# Loop through the apps and install them
progress=0
for app in $apps_to_install; do
    ((progress++))
    echo "Installing $app..."
    flatpak install flathub $app -y
    check_installation $app
    show_progress $progress $total_apps
done

echo

echo "****************************************************************"
echo "Installation completed!"
echo "Successfully installed: ${success_apps%, }"
echo "Failed to install: ${failed_apps%, }"
echo "****************************************************************"
