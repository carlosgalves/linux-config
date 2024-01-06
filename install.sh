#!/bin/sh

# fedora packages
sudo ./fedora-packages.sh

# install apps
sudo ./flatpack-app-install.sh

# gnome extensions
sudo ./extension-installer.sh

# lamp
sudo ./lamp.sh

# docker
sudo ./docker-install.sh