#!/bin/sh

log_file="log.txt"


# Variables to store installation status
success_apps=""
failed_apps=""
total_apps=22

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

display_progress() {
    echo "Progress: $1/$total_apps"
}

# Display information about adding Flathub repository
echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub repository added successfully!"

# onlyoffice
display_progress 1
echo "Installing OnlyOffice..."
flatpak install flathub org.onlyoffice.desktopeditors -y
check_installation "OnlyOffice"

# thunderbird
display_progress 2
echo "Installing Thunderbird..."
flatpak install flathub org.mozilla.Thunderbird -y
check_installation "Thunderbird"

# planify
display_progress 3
echo "Installing Planify..."
flatpak install flathub io.github.alainm23.planify -y
check_installation "Planify"

# postman
display_progress 4
echo "Installing Postman..."
flatpak install flathub com.getpostman.Postman -y
check_installation "Postman"

# podman
display_progress 5
echo "Installing Podman Desktop..."
flatpak install flathub io.podman_desktop.PodmanDesktop -y
check_installation "Podman Desktop"

# krita
display_progress 6
echo "Installing Krita..."
flatpak install flathub org.kde.krita -y
check_installation "Krita"

# ms teams
display_progress 7
echo "Installing Microsoft Teams..."
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y
check_installation "Microsoft Teams"

# discord
display_progress 8
echo "Installing Discord..."
flatpak install flathub com.discordapp.Discord -y
check_installation "Discord"

# signal
display_progress 9
echo "Installing Signal..."
flatpak install flathub org.signal.Signal -y
check_installation "Signal"

# whatsapp
display_progress 10
echo "Installing Whatsie..."
flatpak install flathub com.ktechpit.whatsie -y
check_installation "Whatsie"

# slack
display_progress 11
echo "Installing Slack..."
flatpak install flathub com.slack.Slack -y
check_installation "Slack"

# steam
display_progress 12
echo "Installing Steam..."
flatpak install flathub com.valvesoftware.Steam -y
check_installation "Steam"

# stremio
display_progress 13
echo "Installing Stremio..."
flatpak install flathub com.stremio.Stremio -y
check_installation "Stremio"

# spotify
display_progress 14
echo "Installing Spotify..."
flatpak install flathub com.spotify.Client -y
check_installation "Spotify"

# bottles
display_progress 15
echo "Installing Bottles..."
flatpak install flathub com.usebottles.bottles -y
check_installation "Bottles"

# remmina
display_progress 16
echo "Installing Remmina..."
flatpak install flathub org.remmina.Remmina -y
check_installation "Remmina"

# keepass
display_progress 17
echo "Installing KeePassXC..."
flatpak install flathub org.keepassxc.KeePassXC -y
check_installation "KeePassXC"

# terminal
display_progress 18
echo "Installing Blackbox..."
flatpak install flathub com.raggesilver.BlackBox -y
check_installation "Blackbox"

# warehouse: flatpack manager
display_progress 19
echo "Installing Warehouse..."
flatpak install flathub io.github.flattool.Warehouse -y
check_installation "Warehouse"

# system resources
display_progress 20
echo "Installing System Resources..."
flatpak install flathub net.nokyan.Resources -y
check_installation "System Resources"

# autenticacao gov
display_progress 21
wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak
echo "Installing Autenticação Gov..." 
flatpak install pteid-mw-linux.x86_64.flatpak -y
check_installation "Autenticação Gov"

# denaro
display_progress 22
echo "Installing Denaro..."
flatpak install flathub org.nickvision.money -y
check_installation "Denaro"

# ms edge
#echo "Installing Microsoft Edge..."
#flatpak install flathub com.microsoft.Edge -y
#check_installation "Microsoft Edge"

# backup

# wine

# scrcpy



# Display success and failure messages
echo "****************************************************************"
echo "Installation completed!"
echo "Successfully installed: \033[32m${success_apps%, }\033[0m"
echo "Failed to install: \033[31m${failed_apps%, }\033[0m"
echo "****************************************************************"
