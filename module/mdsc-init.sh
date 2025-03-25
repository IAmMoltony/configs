#!/usr/bin/env bash

# Module script initialization

builtin cd "$HOME/configs/module/$1" || {
    echo "Couldn't enter module '$1' directory."
    exit 1
}

if [[ ! -f "module.txt" ]]; then
    echo "Module $1 does not contain a module file"
    exit 2
fi
