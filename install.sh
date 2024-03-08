#!/bin/bash

cpcfg() {
    echo "Installing $1"
    cp $1 $HOME/$1
}

cpcfgd() {
    echo "Installing $1"
    cp $1 $HOME/$2/$1
}

cpcfgdas() {
    echo "Instanning $1"
    cp $1 $HOME/$2/$3
}

echo "Creating melonDS config dir"
mkdir -p $HOME/.config/melonDS

echo "Creating Bash config dir"
mkdir -p $HOME/.bash-configs

echo "Creating Kitty config dir"
mkdir -p $HOME/.config/kitty

echo "Creating qutebrowser config dir"
mkdir -p $HOME/.config/qutebrowser

# dot files

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfgd .bash_aliases .bash-configs
cpcfgd .bash_functions .bash-configs
cpcfgd kitty.conf .config/kitty
cpcfgdas qutebrowser_config.py .config/qutebrowser config.py

echo "Copying melonDS config"
cp melonDS.ini $HOME/.config/melonDS/melonDS.ini

echo "Success"
