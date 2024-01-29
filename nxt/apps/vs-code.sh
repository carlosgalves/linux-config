#! /bin/bash

source helpers/check-installation.sh

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
dnf -y install code

extensions=(
  "pkief.material-icon-theme"
  "alefragnani.project-manager"
  "visualstudioexptteam.vscodeintellicode"
  "christian-kohler.path-intellisense"
  "redhat.java"
  "vscjava.vscode-java-debug"
  "vscjava.vscode-java-dependency"
  "vscjava.vscode-java-test"
  "vscjava.vscode-maven"
  "tomoki1207.pdf"
  "visualstudioexptt"
  "ms-python.python"
  "python.vscode-pylance"
  "ms-vscode.cpptools"
  "github.vscode-pull-request-github"
  "ms-azuretools.vscode-docker"
  "ms-vscode-remote.remote-containers"
  "ms-vscode-remote.remote-ssh"
  "ms-vscode-remote.remote-ssh-edit"
  "ms-vscode.remote-explorer"
  "postman.postman-for-vscode"
  "humao.rest-client"
  "msjsdiag.vscode-react-native"
  "ecmel.vscode-html-css"
  "pranaygp.vscode-css-peek"
  "ritwickdey.liveserver"
  "mtxr.sqltools"
  "redhat.vscode-yaml"
  "redhat.vscode-xml"
  "bmewburn.vscode-intelephense-client"
  "xdebug.php-debug"
)

for extension in "${extensions[@]}"; do
  -u "$(logname)" code --install-extension "$extension"
done

check_installation "vs code"