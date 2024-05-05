#!/bin/bash

cpcfg() {
    echo "Syncing $1"
    cp $HOME/$1 .
}

cpcfgf() {
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
cpcfg .conkyrc
cpcfg .bday
cpcfg .config/melonDS/melonDS.ini
cpcfg .config/compton/compton.conf
cpcfgf .config/i3/config i3cfg

echo "Success"

echo "Changed files:"
git ls-files -m
