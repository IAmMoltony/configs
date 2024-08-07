#!/bin/bash

# TODO use XDG data directories

cpcfg() {
    echo "Installing $1"
    cp "$1" "$HOME"/"$1"
}

cpcfgd() {
    echo "Installing $1"
    cp "$1" "$HOME"/"$2"/"$1"
}

cpcfgdf() {
    echo "Installing $1"
    cp "$1" "$HOME"/"$2"
}

echo "Creating melonDS config dir"
mkdir -p "$HOME"/.config/melonDS

echo "Creating Bash config dir"
mkdir -p "$HOME"/.bash-configs

echo "Creating Kitty config dir"
mkdir -p "$HOME"/.config/kitty

echo "Creating i3 config dir"
mkdir -p "$HOME"/.config/i3

echo "Creating compton config dir"
mkdir -p "$HOME"/.config/compton

echo "Creating BleachBit config dir"
mkdir -p "$HOME"/.config/bleachbit

echo "Creating Openbox config dir"
mkdir -p "$HOME"/.config/openbox

echo "Creating qutebrowser config dir"
mkdir -p "$HOME"/.config/qutebrowser

echo "Creating mpv config dir"
mkdir -p "$HOME"/.config/mpv

cpcfg .bashrc
cpcfg .gitconfig
cpcfg .profile
cpcfg .vimrc
cpcfg .conkyrc
cpcfgd .bash_aliases .bash-configs
cpcfgd .bash_functions .bash-configs
cpcfgd kitty.conf .config/kitty
cpcfgd compton.conf .config/compton
cpcfgd melonDS.ini .config/melonDS
cpcfgd bleachbit.ini .config/bleachbit
cpcfgd mpv.conf .config/mpv
cpcfgdf i3cfg .config/i3/config
cpcfgdf qutebrowser.py .config/qutebrowser/config.py
cpcfgdf obrc.xml .config/openbox/rc.xml
cpcfgdf obautostart.sh .config/openbox/autostart.sh
cpcfgdf mpvinput.conf .config/mpv/input.conf

echo "Success"
