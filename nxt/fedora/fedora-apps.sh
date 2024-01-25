#!/bin/bash

log_file="log.txt"
success_apps=""
failed_apps=""

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

sudo dnf -y update

echo "Installing Fedora Apps..."

# speedtest-cli
echo "Installing speedtest-cli..."
sudo dnf install -y python
sudo dnf install -y speedtest-cli
check_installation "speedtest-cli"

# webapps
echo "Installing webapp manager..."
sudo dnf copr enable refi64/webapp-manager -y
sudo dnf -y install webapp-manager
check_installation "webapps"

# scr-cpy
dnf copr enable zeno/scrcpy -y && dnf install -y scrcpy