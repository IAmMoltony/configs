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

config_dirs=(
    "$HOME/.config/melonDS"
    "$HOME/.config/bash-configs"
    "$HOME/.config/kitty"
    "$HOME/.config/i3"
    "$HOME/.config/compton"
    "$HOME/.config/bleachbit"
    "$HOME/.config/openbox"
    "$HOME/.config/qutebrowser"
    "$HOME/.config/mpv"
    "$HOME/.config/git"
    "$HOME/.config/conky"
    "$HOME/.config/gdb"
)

echo "Creating configuration directories..."
for dir in "${config_dirs[@]}"; do
    echo " $dir"
    mkdir -p "$dir"
done

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
cpcfgdf .conkyrc .config/conky/conky.conf

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

function bashrc-mksml() {
    mv "$HOME"/.bashrc ./bashrc.old
    ln -s "$(pwd)"/.bashrc "$HOME"/.bashrc
}

# TODO make this a function
echo "Setting up bashrc symlink"

if [ -L "$HOME"/.bashrc ]; then
    echo "Bashrc symlink already set up"
elif [ -f "$HOME"/.bashrc ]; then
    if [ "$1" == "-fsl" ]; then # fsl -> force symlink
        echo "Creating symlink for .bashrc"
        bashrc-mksml
    else
        echo "Bashrc is NOT a symlink"
        echo "Replace with symlink? A copy of the file will be created in $(pwd) under the name 'bashrc.old'."
        read -p "(y = yes, n = no) : " yn
        case $yn in
            [Yy]* )
                bashrc-mksml
                echo "Done!"
                ;;
            [Nn]* )
                echo "Okay, keeping the old bashrc."
                ;;
            * )
                echo "I'll take this as a no."
                ;;
        esac
    fi
else
    echo "Bashrc not found, creating symlink"
    ln -s "$(pwd)"/.bashrc "$HOME"/.bashrc
    echo "Done!"
fi

if [ -d "$HOME/.config/jellyfin-mpv-shim" ]; then
    echo "Setting up Jellyfin mpv shim symlinks"
    echo "Any previous configuration will be moved to the home directory"

    if [ ! -L "$HOME/.config/jellyfin-mpv-shim/mpv.conf" ] && [ -L "$HOME/.config/mpv/mpv.conf" ]; then
        echo "Setting up mpv.conf symlink"
        [ -f "$HOME/.config/jellyfin-mpv-shim/mpv.conf" ] && mv "$HOME/.config/jellyfin-mpv-shim/mpv.conf" "$HOME/jellyfin_mpv.conf.old" || true
        ln -s "$HOME/.config/mpv/mpv.conf" "$HOME/.config/jellyfin-mpv-shim/mpv.conf"
    fi

    if [ ! -L "$HOME/.config/jellyfin-mpv-shim/input.conf" ]; then
        echo "Setting up input.conf symlink"
        [ -f "$HOME/.config/jellyfin-mpv-shim/input.conf" ] && mv "$HOME/.config/jellyfin-mpv-shim/input.conf" "$HOME/jellyfin_mpv_input.conf.old" || true
        ln -s "$HOME/.config/mpv/input.conf" "$HOME/.config/jellyfin-mpv-shim/input.conf"
    fi

    if [ ! -L "$HOME/.config/jellyfin-mpv-shim/scripts" ]; then
        echo "Setting up script directory symlink"
        [ -d "$HOME/.config/jellyfin-mpv-shim/scripts" ] && mv "$HOME/.config/jellyfin-mpv-shim/scripts" "$HOME/jellyfin_mpv_scripts_old" || true
        ln -s "$HOME/.config/mpv/scripts" "$HOME/.config/jellyfin-mpv-shim/scripts"
    fi
else
    echo "Jellyfin mpv shim config directory not found, skip symlink setup"
fi

echo "Success"
