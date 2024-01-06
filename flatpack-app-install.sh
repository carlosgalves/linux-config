#!/bin/sh

# Display information about adding Flathub repository
echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Flathub repository added successfully!"

# Variables to store installation status
success_apps=""
failed_apps=""

# Function to check installation status
check_installation() {
    if [ $? -eq 0 ]; then
        success_apps="$success_apps$1, "
    else
        failed_apps="$failed_apps$1, "
    fi
}

### produtividade ###
# onlyoffice
echo "Installing OnlyOffice..."
flatpak install flathub org.onlyoffice.desktopeditors
check_installation "OnlyOffice"

# thunderbird
echo "Installing Thunderbird..."
flatpak install flathub org.mozilla.Thunderbird
check_installation "Thunderbird"

# planify
echo "Installing Planify..."
flatpak install flathub io.github.alainm23.planify
check_installation "Planify"

# ms edge
#echo "Installing Microsoft Edge..."
#flatpak install flathub com.microsoft.Edge
#check_installation "Microsoft Edge"

### programação ###
# vs code
#echo "Installing Visual Studio Code..."
#flatpak install flathub com.visualstudio.code
#check_installation "Visual Studio Code"

# postman
echo "Installing Postman..."
flatpak install flathub com.getpostman.Postman
check_installation "Postman"

# podman
echo "Installing Podman Desktop..."
flatpak install flathub io.podman_desktop.PodmanDesktop
check_installation "Podman Desktop"

# krita
echo "Installing Krita..."
flatpak install flathub org.kde.krita
check_installation "Krita"

### faculdade ###
# ms teams
echo "Installing Microsoft Teams..."
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux
check_installation "Microsoft Teams"

### social ###
# discord
echo "Installing Discord..."
flatpak install flathub com.discordapp.Discord
check_installation "Discord"

# signal
echo "Installing Signal..."
flatpak install flathub org.signal.Signal
check_installation "Signal"

# whatsapp
echo "Installing Whatsie..."
flatpak install flathub com.ktechpit.whatsie
check_installation "Whatsie"

### trabalho ###
# slack
echo "Installing Slack..."
flatpak install flathub com.slack.Slack
check_installation "Slack"

### jogos ###
# steam
echo "Installing Steam..."
flatpak install flathub com.valvesoftware.Steam
check_installation "Steam"

### lazer ###
# stremio
echo "Installing Stremio..."
flatpak install flathub com.stremio.Stremio
check_installation "Stremio"

# spotify
echo "Installing Spotify..."
flatpak install flathub com.spotify.Client
check_installation "Spotify"

### windows ###
# bottles
echo "Installing Bottles..."
flatpak install flathub com.usebottles.bottles
check_installation "Bottles"

# wine

### sistema ###
# scrcpy

# remmina
echo "Installing Remmina..."
flatpak install flathub org.remmina.Remmina
check_installation "Remmina"

# keepass
echo "Installing KeePassXC..."
flatpak install flathub org.keepassxc.KeePassXC
check_installation "KeePassXC"

# terminal
flatpak install flathub com.raggesilver.BlackBox

# warehouse: flatpack manager
echo "Installing Warehouse..."
flatpak install flathub io.github.flattool.Warehouse
check_installation "Warehouse"

# backup


# system resources
echo "Installing System Resources..."
flatpak install flathub net.nokyan.Resources
check_installation "System Resources"

# autenticacao gov
wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak
echo "Installing Autenticação Gov..."
flatpak install pteid-mw-linux.x86_64.flatpak
check_installation "Autenticação Gov"

# Display success and failure messages
echo "****************************************************************"
echo "Installation completed!"
echo "Successfully installed: ${success_apps%, }"
echo "Failed to install: ${failed_apps%, }"
echo "****************************************************************"
