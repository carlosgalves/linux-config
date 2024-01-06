#!/bin/sh
sudo dnf -y install bash-completion curl wget telnet

#repositories
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# multimedia codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

## speedtest-cli
sudo dnf install -y python
sudo dnf install -y speedtest-cli


# node
sudo dnf -y install nodejs
