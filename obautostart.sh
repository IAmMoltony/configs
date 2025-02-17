#!/usr/bin/bash

xset s off -dpms &
dunst &
xcompmgr &
nm-applet &
qbittorrent &
rhythmbox &
conky &
lxpolkit &
~/configs/change-wallpaper &
xfce4-panel --disable-wm-check &
blueman-applet &
onboard &
fcitx5 &

notify-send "Init done!!"
