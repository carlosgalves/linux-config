#!/bin/sh

log_file="log.txt"

check_installation() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $1" >> "$log_file"
    else
        echo "[FAILURE] $1" >> "$log_file"
    fi
}

echo "Installing Autenticação Gov..."

wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak

flatpak install -y pteid-mw-linux.x86_64.flatpak

check_installation "Autenticação Gov"

rm pteid-mw-linux.x86_64.flatpak
