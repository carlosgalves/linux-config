#!/bin/sh

# fedora packages
#sudo ./fedora-packages.sh

# install apps
#sudo ./flatpack-app-install.sh

# gnome extensions
#sudo ./extension-installer.sh

# lamp
#sudo ./lamp.sh

# docker
#sudo ./docker-install.sh


log_file="log.txt"

echo "Install status:"
awk '/\[SUCCESS\]/ {gsub(/.*\[SUCCESS\] /, "\033[32m&\033[0m"); print}' "$log_file"
awk '/\[FAILURE\]/ {gsub(/.*\[FAILURE\] /, "\033[31m&\033[0m"); print}' "$log_file"
