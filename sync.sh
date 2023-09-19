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
cp $HOME/.config/xfce4 . -r
rm -r xfce4/xfce4-screenshooter xfce4/desktop xfce4/panel

echo "Success"
