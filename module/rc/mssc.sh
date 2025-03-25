#!/usr/bin/env bash

# Run Machine-Specific Startup Commands (MSSC)
# This became necessary when I wanted to install nvm on WSL but I don't use nvm on my laptop

if [ -f "$HOME/.mssc" ]; then
    echo -e "\n\033[0m"
    source "$HOME"/.mssc
fi
