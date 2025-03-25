#!/usr/bin/env bash

if ! command -v python3 > /dev/null 2>&1; then
    clear
    echo "!!!! ATTENTION !!!!"
    echo "YOU DO NOT HAVE PYTHON 3 INSTALLED !!!!!!!"
    echo "INSTALL NOW OR YOU WILL REGRET IT!!!!!!!!!!!!!"
    read -p -e "press enter"
    clear
fi
