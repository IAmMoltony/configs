#!/usr/bin/env bash

# Module loader
# it loads modules

has_bc() {
    command -v "bc" > /dev/null 2>&1
    return $?
}

oldpwd="$(pwd)"

. "$HOME/configs/module/mdsc-init.sh"

echo -e "Loading module \033[0;32m$1\033[0m"
local ModuleStartTime=$(date +%s.%N)

while IFS= read -r module; do
    if [[ -f "$module.sh" ]]; then
        local module_clean_name="$(echo "$module" | sed 's/\//->/g')"
        local SubmoduleStartTime=$(date +%s.%N)
        . "$module.sh"
        local SubmoduleEndTime=$(date +%s.%N)
        if has_bc; then
            local SubmoduleRuntime=$(echo "scale=3; ($SubmoduleEndTime - $SubmoduleStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
            echo -e "  Loaded submodule \033[0;33m$1->$module_clean_name\033[0m in \033[0;36m$SubmoduleRuntime\033[0m sec"
        else
            echo -e "  Loaded submodule \033[0;33m$1->$module_clean_name\033[0m"
        fi
    else
        echo "Sub-module '$1' not found."
    fi
done < "module.txt"

local ModuleEndTime=$(date +%s.%N)
if has_bc; then
    local ModuleRuntime=$(echo "scale=3; ($ModuleEndTime - $ModuleStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
    echo -e "Loaded module \033[0;32m$1\033[0m in \033[0;36m$ModuleRuntime\033[0m sec"
else
    echo -e "Loaded module \033[0;32m$1\033[0m"
fi

DementiaShell=0
builtin cd "$oldpwd"
DementiaShell=1
