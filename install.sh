#!/bin/bash

cpcfg() {
    echo "Installing $1"
    cp $1 $HOME/$1
}

cpcfgd() {
    echo "Installing $1"
    cp $1 $HOME/$2/$1
}

echo "Creating melonDS config dir"
mkdir -p $HOME/.config/melonDS

echo "Creating Bash config dir"
mkdir -p $HOME/.bash-configs

# dot files

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfg .bash_aliases .bash-configs
cpcfg .bash_functions .bash-configs

echo "Copying melonDS config"
cp melonDS.ini $HOME/.config/melonDS/melonDS.ini

echo "Success"
