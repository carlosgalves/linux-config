#!/bin/bash

log_file="log.txt"

# Two-dimensional array with package names and app names
apps_to_install=(
    "org.onlyoffice.desktopeditors OnlyOffice"
    "org.mozilla.Thunderbird Thunderbird"
    "io.github.alainm23.planify Planify"
    "com.getpostman.Postman Postman"
    "io.podman_desktop.PodmanDesktop Podman Desktop"
    "org.kde.krita Krita"
    "com.github.IsmaelMartinez.teams_for_linux Microsoft Teams"
    "com.discordapp.Discord Discord"
    "com.ktechpit.whatsie Whatsie"
    "com.slack.Slack Slack"
    "com.valvesoftware.Steam Steam"
    "com.stremio.Stremio Stremio"
    "com.spotify.Client Spotify"
    "com.usebottles.bottles Bottles"
    "org.keepassxc.KeePassXC KeePassXC"
    "com.raggesilver.BlackBox BlackBox"
    "io.github.flattool.Warehouse Warehouse"
    "net.nokyan.Resources Resources"
    "org.nickvision.money Denaro"
    "com.ranfdev.Notify Notify"
    "org.nickvision.tubeconverter Parabolic"
    "org.gnome.World.PikaBackup Pika Backup"
)

# Variables to store installation status
success_apps=""
failed_apps=""
total_apps=${#apps_to_install[@]}

# Function to check installation status and retry if unsuccessful
check_installation() {
    local app_name=$1

    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $app_name" >> "$log_file"
        success_apps="$success_apps$app_name, "
        return 0  # Exit the function with success status
    else
        echo "[FAILURE] $app_name" >> "$log_file"
        failed_apps="$failed_apps$app_name, "
        return 1  # Exit the function with failure status
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
for app_entry in "${apps_to_install[@]}"; do
    IFS=' ' read -r package_name app_name <<< "$app_entry"
    progress=$((progress + 1))
    echo "Installing $app_name..."
    flatpak install flathub $package_name -y
    check_installation "$app_name"
    show_progress $progress $total_apps
done