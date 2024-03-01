#!/bin/bash

apps_to_install=(
    #"org.onlyoffice.desktopeditors OnlyOffice"
    "org.mozilla.Thunderbird Thunderbird"
    "com.getpostman.Postman Postman"
    #"io.podman_desktop.PodmanDesktop Podman Desktop"
    #"org.kde.krita Krita"
    #"com.github.IsmaelMartinez.teams_for_linux Microsoft Teams"
    #"com.discordapp.Discord Discord"
    #"com.slack.Slack Slack"
    #"com.valvesoftware.Steam Steam"
    #"com.stremio.Stremio Stremio"
    #"com.spotify.Client Spotify"
    #"com.usebottles.bottles Bottles"
    "org.keepassxc.KeePassXC KeePassXC"
    #"com.raggesilver.BlackBox BlackBox"
    #"io.github.flattool.Warehouse Warehouse"
    #"net.nokyan.Resources Resources"
    #"com.ranfdev.Notify Notify"
    #"org.nickvision.tubeconverter Parabolic"
    #"org.gnome.World.PikaBackup Pika Backup"
    #"md.obsidian.Obsidian Obsidian"
    #"com.jgraph.drawio.desktop Drawio"
    #"com.github.tchx84.Flatseal Flatseal"
    #"com.todoist.Todoist Todoist"
    #"app.drey.Warp Warp"
    "us.zoom.Zoom Zoom"
    #"io.github.mimbrero.WhatsAppDesktop Whatsapp"
)

total_apps=${#apps_to_install[@]}

source helpers/check-installation.sh

echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub repository added successfully!"

source "helpers/progress-bar.sh"

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