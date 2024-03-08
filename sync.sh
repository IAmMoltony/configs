#!/bin/bash

cpcfg() {
    echo "Syncing $1"
    cp $HOME/$1 .
}

cpcfgas() {
    echo "Syncing $1 as $2"
    cp $HOME/$1 ./$2
}

mkdir .config/kitty -p

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfg .bash-configs/.bash_aliases
cpcfg .bash-configs/.bash_functions
cpcfg .config/kitty/kitty.conf
cpcfgas .config/qutebrowser/config.py qutebrowser_config.py

echo "Syncing melonDS config"
cp $HOME/.config/melonDS/melonDS.ini .

echo "Success"

echo "Changed files:"
git ls-files -m
