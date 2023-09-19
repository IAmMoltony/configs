#!/bin/bash

mkdir -p $HOME/.config/melonDS

cp .bashrc $HOME/.bashrc
cp .gitconfig $HOME/.gitconfig
cp melonDS.ini $HOME/.config/melonDS/melonDS.ini
cp .profile $HOME/.profile
cp .vimrc $HOME/.vimrc

read -p "Do you use Xfce? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]] then
    echo "Okay, installing"
    cp -r xfce4 $HOME/.config/xfce4
fi

echo "Success"
