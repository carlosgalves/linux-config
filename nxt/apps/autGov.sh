#!/bin/bash

source helpers/check-installation.sh

dnf -y update

echo "Installing Autenticação Gov..."

wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak

flatpak install -y pteid-mw-linux.x86_64.flatpak

check_installation "Autenticação Gov"

rm pteid-mw-linux.x86_64.flatpak
