#!/bin/bash

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

fastcomputermessage() {
    echo "Done!"
    echo "The new config file is optimized for a fast computer by default. You can choose using the 'mpvcfgset' command."
}

echo "Creating melonDS config dir"
mkdir -p "$HOME"/.config/melonDS

echo "Creating Bash config dir"
mkdir -p "$HOME"/.config/bash-configs

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

echo "Creating Git config dir"
mkdir -p "$HOME"/.config/git

echo "Creating Conky config dir"
mkdir -p "$HOME"/.config/conky

echo "Creating GDB config dir"
mkdir -p "$HOME"/.config/gdb

cpcfg .profile
cpcfg .vimrc
cpcfgd kitty.conf .config/kitty
cpcfgd compton.conf .config/compton
cpcfgd melonDS.ini .config/melonDS
cpcfgd bleachbit.ini .config/bleachbit
cpcfgd gdbinit .config/gdb
cpcfgdf i3cfg .config/i3/config
cpcfgdf qutebrowser.py .config/qutebrowser/config.py
cpcfgdf obrc.xml .config/openbox/rc.xml
cpcfgdf obautostart.sh .config/openbox/autostart.sh
cpcfgdf mpvinput.conf .config/mpv/input.conf
cpcfgdf .gitconfig .config/git/config
cpcfgdf .conkyrc .config/conky/conkyrc

echo "Setting up mpv config symlink"

if [ -L "$HOME"/.config/mpv/mpv.conf ]; then
    echo "mpv config symlink already set up"
elif [ -f "$HOME"/.config/mpv/mpv.conf ]; then
    echo "mpv config file is NOT a symlink"
    echo "Replace with symlink? A copy of the file will be created in $(pwd) under the name 'mpv.conf.old'."
    read -p "(y = yes, n = no) : " yn
    case $yn in
        [Yy]* )
            mv "$HOME"/.config/mpv/mpv.conf ./mpv.conf.old
            ln -s "$(pwd)"/mpv-fastcomputer.conf "$HOME"/.config/mpv/mpv.conf
            fastcomputermessage
            ;;
        [Nn]* )
            echo "Okay, keeping the old config file."
            ;;
        * )
            echo "I'll take this as a no."
            ;;
    esac
else
    echo "mpv config file not found, creating symlink"
    ln -s "$(pwd)"/mpv-fastcomputer.conf "$HOME"/.config/mpv/mpv.conf
    fastcomputermessage
fi

# TODO make this a function
echo "Setting up bashrc symlink"

if [ -L "$HOME"/.bashrc ]; then
    echo "Bashrc symlink already set up"
elif [ -f "$HOME"/.bashrc ]; then
    echo "Bashrc is NOT a symlink"
    echo "Replace with symlink? A copy of the file will be created in $(pwd) under the name 'bashrc.old'."
    read -p "(y = yes, n = no) : " yn
    case $yn in
        [Yy]* )
            mv "$HOME"/.bashrc ./bashrc.old
            ln -s "$(pwd)"/.bashrc "$HOME"/.bashrc
            echo "Done!"
            ;;
        [Nn]* )
            echo "Okay, keeping the old bashrc."
            ;;
        * )
            echo "I'll take this as a no."
            ;;
    esac
else
    echo "Bashrc not found, creating symlink"
    ln -s "$(pwd)"/.bashrc "$HOME"/.bashrc
    echo "Done!"
fi

if [ -d "$HOME/.config/jellyfin-mpv-shim" ] && [ -L "$HOME/.config/mpv/mpv.conf" ]; then
    echo "Setting up Jellyfin mpv shim config symlink"
    mv "$HOME/.config/jellyfin-mpv-shim/mpv.conf" "$HOME/jellyfin_mpv.conf.old" || true
    ln -s "$HOME"/.config/mpv/mpv.conf "$HOME/.config/jellyfin-mpv-shim/mpv.conf"
fi

echo "Success"
