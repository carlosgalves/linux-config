#!/bin/bash

log_file="log.txt"

echo "Installing Node.js..."
if dnf -y install nodejs; then
    node_version=$(node --version)
    echo "[SUCCESS] Node ($node_version)" >> "$log_file"
else
    echo "[FAILURE] Node" >> "$log_file"
fi