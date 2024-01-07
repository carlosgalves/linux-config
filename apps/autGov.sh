#!/bin/sh

check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $2" >> "$log_file"
    else
        echo "[FAILURE] $2" >> "$log_file"
    fi
}

echo "Installing Autenticação Gov..."

wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak

flatpak install -y pteid-mw-linux.x86_64.flatpak

check_installation pteid-mw-linux.x86_64.flatpak "Autenticação Gov"

rm pteid-mw-linux.x86_64.flatpak
