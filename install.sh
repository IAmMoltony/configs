#!/bin/bash

function cpcfg {
    echo "Installing $1"
    cp $1 $HOME/$1
}

echo "Creating melonDS config dir"
mkdir -p $HOME/.config/melonDS

# dot files

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfg .bash_aliases

echo "Copying melonDS config"
cp melonDS.ini $HOME/.config/melonDS/melonDS.ini

echo "Success"
