#!/usr/bin/env bash

# Module checker
# it checks modules

oldpwd="$(pwd)"

# TODO separate. they are copypasted both here and in loader

builtin cd "$HOME/configs/module/$1" || {
    echo "Couldn't enter module '$1' directory."
    exit 1
}

if [[ ! -f "module.txt" ]]; then
    echo "Module $1 does not contain a module file"
    exit 2
fi

if ! command -v "shellcheck" > /dev/null 2>&1; then
    echo "Please install shellcheck to perform module checks."
    exit 3
fi

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
