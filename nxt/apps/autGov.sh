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

echo "Installing Autenticação Gov..."

wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak

flatpak install -y pteid-mw-linux.x86_64.flatpak

check_installation "Autenticação Gov"

rm pteid-mw-linux.x86_64.flatpak
