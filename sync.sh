#!/bin/bash

cpcfg() {
    echo "Syncing $1"
    cp $HOME/$1 .
}

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc

echo "Syncing melonDS config"
cp $HOME/.config/melonDS/melonDS.ini .

echo "Success"

echo "Changed files:"
git ls-files -m
