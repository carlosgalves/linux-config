#!/bin/bash
log_file="log.txt"

sudo dnf update -y

echo "Installing Python..."
if dnf -y install python3; then
    python_version=$(python3 --version)
    echo "[SUCCESS] $python_version" >> "$log_file"
    conda config --set auto_activate_base False
else
    echo "[FAILURE] Python installation" >> "$log_file"
fi

# Anaconda
echo "Installing Anaconda..."
if dnf -y install conda; then
    conda_version=$(conda --version)
    echo "[SUCCESS] $conda_version" >> "$log_file"
else
    echo "[FAILURE] Anaconda" >> "$log_file"
fi