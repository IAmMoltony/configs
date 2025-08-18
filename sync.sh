#!/bin/bash

cpcfg() {
    echo "Syncing $1"
    if [ -f "$HOME"/"$1" ]; then
        cp "$HOME"/"$1" .
    else
        echo "Warning: Skipping file $1 because path $HOME/$1 not found."
    fi
}

cpcfgf() {
    echo "Syncing $1 as $2"
    if [ -f "$HOME"/"$1" ]; then
        cp "$HOME"/"$1" ./"$2"
    else
        echo "Warning: Skipping file $1 because path $HOME/$1 not found."
    fi
}

mkdir .config/kitty -p

cpcfg .profile
cpcfg .vimrc
cpcfg .config/kitty/kitty.conf
cpcfg .config/melonDS/melonDS.ini
cpcfg .config/compton/compton.conf
cpcfg .config/bleachbit/bleachbit.ini
cpcfg .config/gdb/gdbinit
cpcfgf .config/qutebrowser/config.py qutebrowser.py
cpcfgf .config/i3/config i3cfg
cpcfgf .config/openbox/rc.xml obrc.xml
cpcfgf .config/openbox/autostart.sh obautostart.sh
cpcfgf .config/mpv/input.conf mpvinput.conf
cpcfgf .config/git/config .gitconfig
cpcfgf .config/conky/conky.conf .conkyrc

echo "Success"

changed_files="$(git ls-files -m)"
changed_files_pad="$(echo "$changed_files" | sed 's/^/ /')"

new_files="$(git ls-files --others --exclude-standard)"
new_files_pad="$(echo "$new_files" | sed 's/^/ /')"

deleted_files="$(git ls-files --deleted)"
deleted_files_pad="$(echo "$deleted_files" | sed 's/^/ /')"

if [ -z "$changed_files" ]; then
    echo "No changed files."
else
    echo "Changed files:"
    echo "$changed_files_pad"
fi

if [ -z "$new_files" ]; then
    echo "No new files."
else
    echo "New files:"
    echo "$new_files_pad"
fi

if [ -z "$deleted_files" ]; then
    echo "No deleted files."
else
    echo "Deleted files:"
    echo "$deleted_files_pad"
fi
