#!/bin/sh

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
    # com.microsoft.Edge
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

# Display information about adding Flathub repository
echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub repository added successfully!"

# Loop through the apps and install them
for app in $apps_to_install; do
    display_progress=$((display_progress + 1))
    echo "Installing $app..."
    flatpak install flathub $app -y
    check_installation $app
done




echo "****************************************************************"
echo "Installation completed!"
echo "Successfully installed: \033[32m${success_apps%, }\033[0m"
echo "Failed to install: \033[31m${failed_apps%, }\033[0m"
echo "****************************************************************"
