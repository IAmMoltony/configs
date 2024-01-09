#!/bin/bash

cpcfg() {
    echo "Syncing $1"
    cp $HOME/$1 .
}

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfg .bash_aliases
cpcfg .bash_functions

echo "Syncing melonDS config"
cp $HOME/.config/melonDS/melonDS.ini .

echo "Success"

echo "Changed files:"
git ls-files -m
