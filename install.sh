#!/bin/bash

cpcfg() {
    echo "Installing $1"
    cp $1 $HOME/$1
}

cpcfgd() {
    echo "Installing $1"
    cp $1 $HOME/$2/$1
}

cpcfgdf() {
    echo "Installing $1"
    cp $1 $HOME/$2
}

echo "Creating melonDS config dir"
mkdir -p $HOME/.config/melonDS

echo "Creating Bash config dir"
mkdir -p $HOME/.bash-configs

echo "Creating Kitty config dir"
mkdir -p $HOME/.config/kitty

echo "Creating i3 config dir"
mkdir -p $HOME/.config/i3

echo "Creating compton config dir"
mkdir -p $HOME/.config/compton

# dot files

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfg .conkyrc
cpcfg .bday
cpcfgd .bash_aliases .bash-configs
cpcfgd .bash_functions .bash-configs
cpcfgd kitty.conf .config/kitty
cpcfgd compton.conf .config/compton
cpcfgdf i3cfg .config/i3/config

echo "Copying melonDS config"
cp melonDS.ini $HOME/.config/melonDS/melonDS.ini

echo "Success"
