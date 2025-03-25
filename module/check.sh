#!/usr/bin/env bash

# Module checker
# it checks modules

oldpwd="$(pwd)"

. "$HOME/configs/module/mdsc-init.sh"

echo "Checking module $1"

while IFS= read -r module; do
    if [[ -f "$module.sh" ]] then
        shellcheck "$module.sh"
    else
        echo "Sub-module '$1' not found."
    fi
done < "module.txt"

echo "Checked module $1"

builtin cd "$oldpwd"
