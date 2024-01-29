#!/bin/bash

source helpers/check-installation.sh

echo "Installing Fedora packages..."

# Install essential packages
echo "Adding essential packages..."
dnf -y install bash-completion curl wget telnet

# Enable RPM Fusion repositories
dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Multimedia codecs
echo "Installing multimedia codecs..."
dnf swap ffmpeg-free ffmpeg --allowerasing -y
dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
dnf groupupdate sound-and-video -y
#dvd
dnf install rpmfusion-free-release-tainted -y
dnf install libdvdcss -y
check_installation "Multimedia codecs"