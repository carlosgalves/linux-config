#!/bin/sh

log_file="log.txt"
success_apps=""
failed_apps=""

check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $1" >> "$log_file"
        success_apps="$success_apps$1, "
    else
        echo "[FAILURE] $1" >> "$log_file"
        echo "Retrying installation for $1..."
        sudo dnf install -y $2
        if [ $? -eq 0 ]; then
            echo "[SUCCESS (after retry)] $1" >> "$log_file"
            success_apps="$success_apps$1 (after retry), "
        else
            echo "[FAILURE (after retry)] $1" >> "$log_file"
            failed_apps="$failed_apps$1, "
        fi
    fi
}

echo "Installing Fedora Apps..."

sudo dnf -y update

# speedtest-cli
echo "Installing speedtest-cli..."
sudo dnf install -y python
sudo dnf install -y speedtest-cli
check_installation "speedtest-cli" "python"

# webapps
echo "Installing webapp manager..."
sudo dnf copr enable refi64/webapp-manager -y
sudo dnf -y install webapp-manager
check_installation "webapps"
