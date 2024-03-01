#!/bin/bash

# Copy autostart folder to ~/.config
cp -r "./autostart" "$HOME/.config/" && echo "Added startup applications:" && ls ~/.config/autostart