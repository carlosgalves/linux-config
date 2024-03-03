#!/bin/bash

source helpers/check-installation.sh

dnf -y update

# Python
echo "Installing Python..."
dnf -y install python3
python_version=$(python3 --version)
check_installation "Python" "$python_version"

# Anaconda
echo "Installing Anaconda..."
dnf -y install conda
conda_version=$(conda --version)
check_installation "Anaconda" "$conda_version"