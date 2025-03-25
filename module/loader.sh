#!/usr/bin/env bash

# Module loader
# it loads modules

has_bc() {
    command -v "bc" > /dev/null 2>&1
    return $?
}

oldpwd="$(pwd)"

builtin cd "$HOME/configs/module/$1" || {
    echo "Couldn't enter module '$1' directory."
    exit 1
}

if [[ ! -f "module.txt" ]]; then
    echo "Module $1 does not contain a module file"
    exit 2
fi

echo "Loading module $1"

while IFS= read -r module; do
    if [[ -f "$module.sh" ]]; then
        local module_clean_name="$(echo "$module" | sed 's/\//->/g')"
        local ModuleStartTime=$(date +%s.%N)
        . "$module.sh"
        local ModuleEndTime=$(date +%s.%N)
        if has_bc; then
            local ModuleRuntime=$(echo "scale=3; ($ModuleEndTime - $ModuleStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
            echo "  Loaded submodule $1->$module_clean_name in $ModuleRuntime sec"
        else
            echo "  Loaded submodule $1->$module_clean_name"
        fi
    else
        echo "Sub-module '$1' not found."
    fi
done < "module.txt"

echo "Loaded module $1"

builtin cd "$oldpwd"
