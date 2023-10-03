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

echo "Syncing Xfce config"
rm xfce4 -rf
cp $HOME/.config/xfce4 . -r
rm -rf xfce4/xfce4-screenshooter xfce4/desktop xfce4/panel

echo "Success"
