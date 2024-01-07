#!/bin/sh

log_file="log.txt"
success_apps=""
failed_apps=""

check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $2: $1" >> "$log_file"
        success_apps="$success_apps, $2"
    else
        echo "[FAILURE] $2: $1" >> "$log_file"
        failed_apps="$failed_apps, $2"
    fi
}

echo "Installing Fedora packages..."

# Install essential packages
echo "Adding essential packages..."
sudo dnf -y install bash-completion curl wget telnet 
check_installation "bash-completion curl wget telnet" 

# Enable RPM Fusion repositories
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
check_installation "RPM Fusion repositories" 

# Multimedia codecs
echo "Installing multimedia codecs..."
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
check_installation "Multimedia codecs"

# Install Node.js
echo "Installing Node.js..."
sudo dnf -y install nodejs
# se a instalação tiver sucesso -> guardar versão do node
if [ $? -eq 0 ]; then
    node_version=$(node --version)
    check_installation "Node.js" "Node.js"
    echo "[NODE VERSION]: $node_version" >> "$log_file"
fi
