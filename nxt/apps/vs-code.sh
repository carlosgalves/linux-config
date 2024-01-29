#! /bin/bash

source helpers/check-installation.sh

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
dnf -y install code

extensions=(
    "visualstudioexptteam.vscodeintellicode"
    "redhat.java"
    "tomoki1207.pdf"
    "ms-python.python"
    "github.vscode-pull-request-github"
    "ms-azuretools.vscode-docker"
    "postman.postman-for-vscode"
)

for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done

check_installation "vs code"