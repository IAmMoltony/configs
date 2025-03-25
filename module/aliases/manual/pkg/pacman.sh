#!/usr/bin/env bash

alias spsyu='sudo pacman -Syu --noconfirm --needed' # Update the system (arch linux)
alias spsnc='sudo pacman -S --noconfirm --needed' # Install a package (arch linux)
alias sprnc='sudo pacman -R --noconfirm' # Remove a package (arch linux)
alias spss='sudo pacman -Ss' # Search package (arch linux)
alias sprnsnc='sudo pacman -Rns --noconfirm' # Something about removing pacman package idk (arch linux)
alias spsc='sudo pacman -Sc --noconfirm' # I don't use arch anymore so can't say for sure (arch linux)
alias spsu='sudo pacman -Su --noconfirm' # Update but not download package lists (arch linuh)
alias archlnx-update='spsyu && ysyu' # Update normal pacman packages + aur (arch linux)
alias spsy='echo "no that would be stupid"' # This originally was an alias for `sudo pacman -Sy` but i heard that's bad (arch linux)
