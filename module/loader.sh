#!/usr/bin/env bash

# Module loader
# it loads modules

has_bc() {
    command -v "bc" > /dev/null 2>&1
    return $?
}

oldpwd="$(pwd)"

. "$HOME/configs/module/mdsc-init.sh"

echo "Loading module $1"
local ModuleStartTime=$(date +%s.%N)

while IFS= read -r module; do
    if [[ -f "$module.sh" ]]; then
        local module_clean_name="$(echo "$module" | sed 's/\//->/g')"
        local SubmoduleStartTime=$(date +%s.%N)
        . "$module.sh"
        local SubmoduleEndTime=$(date +%s.%N)
        if has_bc; then
            local SubmoduleRuntime=$(echo "scale=3; ($SubmoduleEndTime - $SubmoduleStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
            echo "  Loaded submodule $1->$module_clean_name in $SubmoduleRuntime sec"
        else
            echo "  Loaded submodule $1->$module_clean_name"
        fi
    else
        echo "Sub-module '$1' not found."
    fi
done < "module.txt"

local ModuleEndTime=$(date +%s.%N)
if has_bc; then
    local ModuleRuntime=$(echo "scale=3; ($ModuleEndTime - $ModuleStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
    echo "Loaded module $1 in $ModuleRuntime sec"
else
    echo "Loaded module $1"
fi

builtin cd "$oldpwd"
