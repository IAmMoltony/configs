#!/usr/bin/bash

# Openbox Autostart Commands

# This makes it so that the screen doesn't turn off when idle
# (it locks my laptop and i have to reboot it)
xset s off -dpms &

# Dunst for notifications
dunst &

# Compositor
xcompmgr &

# Networkmanager
nm-applet &

# qBittorrent
qbittorrent &

# Rhythmbox
rhythmbox &

# Conky for a little time display on my desktop
conky &

# Notes for noting stuff (only start if they're there)
if [ -f "$HOME/Documents/notes.txt" ]; then
    mousepad "$HOME/Documents/notes.txt"
fi

# Policy kit for graphical sudo
lxpolkit &

# Pick a random wallpaper
~/configs/change-wallpaper &

# Panel
xfce4-panel --disable-wm-check &

# Bluetooth for my headphones
blueman-applet &

# Switch to 2nd desktop
wmctrl -s 1
