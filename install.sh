#!/bin/bash

function cpfcg() {
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

echo "Copying melonDS config"
cp melonDS.ini $HOME/.config/melonDS/melonDS.ini

read -p "Do you use Xfce? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Okay, installing"
    cp -r xfce4 $HOME/.config/xfce4
fi

echo "Success"
