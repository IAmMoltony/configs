#!/usr/bin/env bash

# General dumping ground for random aliases.
# TODO add some into modules.

alias rm='rm -iv' # Remove a file (verbose + confirm)
alias cp='cp -v' # Copy a file (verbose)
alias mv='mv -v' # Move a file (verbose)
alias mkdir='mkdir -v' # Create a directory (verbose)
alias rmdir='rmdir -v' # Remove a directory (verbose)
alias md='mkdir' # DOS-inspired shortcut for mkdir
alias rd='rmdir' # DOS-inspired shortcut for rmdir
alias reload-bashrc='source ~/.bashrc' # Reload BashRC
alias reload-bashaliases='echo "Reloading aliases." && source ~/configs/.bash_aliases && echo "Done." && trap - ERR' # Reload Bash aliases
alias reload-bashfuncs='echo "Reloading functions." && source ~/configs/.bash_functions && echo "Done." && trap - ERR' # Reload Bash functions
alias mnt="mount | awk -F ' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | grep -E ^/dev/ | sort" # Show mounted disks (no stuff like tmpfs or whatever)
alias grephist='history | grep' # Search in comman history
alias relbrc='reload-bashrc' # Short reload-bashrc alias
alias relba='reload-bashaliases' # Short reload-bashaliases alias
alias relbf='reload-bashfuncs' # Short reload-bashfuncs alias
alias relcp='reliadcpath' # Short reloadcpath...wait why is it spelled without a hyphen
alias hd='hexdump -C' # Hexdump but pretty (the hd binary is not in every distro)
alias mkaur='makepkg -si --noconfirm' # Make an AUR package
alias reboot='sudo reboot' # Reboot the computer
alias freespc='df -h --total -x tmpfs -x efivarfs -x devtmpfs' # Check free space on the disk
alias doxy='doxygen' # I'm too lazy to type 3 more characters
alias h='history | less' # h(istory)
alias hh='history' # h(istory) (no paged)
alias shutdown='sudo shutdown now' # Shutdown NOW!
alias ysnc='yay -S --noconfirm' # Install AUR package with yay
alias ysyu='yay -Syu --noconfirm' # Update AUR packages with yay
alias yrnc='yay -R --noconfirm' # Say pai pai to AUR package
alias math='bc -l' # Bring up a calculator
alias ghs='grephist' # grephist short edition
alias ping='ping -c 5' # make ping stop after like 5 times that it pinged
alias ln='ln -iv' # ln but yo need to confirm and also verboosey
alias i-am-root='sudo -i' # i am root
alias gaming='cdgam' # Go to folder with GAMING
alias gaming-b='bcdgam' # gaming (builtin cd edition)
alias pshcfgspaipai='pshcfgs && paipai' # Push cfgs and paipia
alias wine64='WINEPREFIX=~/.wine64 wine64' # Convenience: start Wine with the 64-bit prefix
alias wine64cfg='WINEPREFIX=~/.wine64 winecfg' # Convenience 2: configure Wine with the 64-bit prefiix
alias gaming-th='cdth' # touhou
alias gaming-thu='cdthu' # Touhou utilities like thscorefileconveretr
alias thprefix='export WINEPREFIX=$HOME/Games/TouhouShared' # Set current wine prefix to touhou prefix
alias catlessbf='catbf | less' # catbf with pager
alias dirfspraw='du --max-depth=1 -h --all' # Analyze free space in directory (no sort)
alias dirfsp='dirfspraw | sort -h' # Analyze free space in directory
alias diurfsp='dirfsp' # are yuru happy do yuru happy aikotoba honjitsu no dokidoki sutekina happy day hajimemashou chuu chuu chuu chuu chuu la la
alias grn='grep -Irn' # Shortcut for grep -rn
alias rmun='find . -name "*.un~" -exec rm -f {} +' # Remove annoying Vim backup files
alias rf='rm -rf' # h
alias wine64tricks='WINEPREFIX=~/.wine64 winetricks' # Winetricks in 64-bit prefix
alias thu='thunar' # Shorthand for thunar
alias thubkmk='thu ~/Bookmarks &' # Start Thunar in the bookmarks folder
alias restoreresolution='xrandr -s 1366x768' # Restore screen resolution. It's hardcoded in memory of my old laptop, which is now dead.
alias care='love .' # Start love2d
alias dlmus='~/Music/music-lib/download' # Download music
alias dlmusv='dlmus --verbose' # Download music (verbose edition)
alias redlmus='~/Music/music-lib/redownload' # Re-download music
alias mp3cmus='~/Music/music-lib/mp3conv' # Convert music to mp3
alias szmus='~/Music/music-lib/diskspace' # Check how much space music takes up
alias rmmus='~/Music/music-lib/delete.py' # Delete music
alias sma='sudo mount -a' # Short sudo mount -a
alias numalias='alias | wc -l' # Count how many aliases are installed
alias kittyfonts='kitty +list-fonts' # list fonts supported by kityy
alias hsle='echo "Did you mean: hcse"'
alias hsld='echo "Did you mean: hcsd"'
alias hslie='echo "Did you mean: hcsie"'
alias hcse='hcs-enable' # Enable HCS (even tho its called cron sync)
alias hcsd='hcs-disable' # Disable HCS
alias hcsie='hcs-is-enabled' # Check if HCS is enabled
alias ffwcfg='fastfetch -c $HOME/configs/fastfetch-cfg.jsonc' # Run fastfetch with custom config
alias rbrc='relbrc' # Less typing
alias rba='relba' # Even less typing
alias rbf='relbf' # Least typing
alias rcp='relcp' # Negative typing
alias paixorg='sudo pkill -9 Xorg' # kill xorg with ease
alias xlogout='sudo pkill -u $USER' # Log out (works on wayland too)
alias dfs='dirfsp' # less typing less hedayhce
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias updrbrc='updcfgs && rbrc' # Update configs and then reload bashrc
alias prettyjson='python -m json.tool' # Prettify json with a single, easy-to-remember command(tm)!
alias areconf='autoreconf --verbose --install --force' # Autorceonf
alias chx='chmod +x' # Too tired of chmod +x so i shorten it
alias banger='sudo aplay /dev/mem' # PLAY THIS ABSOLUTE BANGER!!!
alias nctcfg='nctcfgs' # Num commits today in configs (bruh edition)
alias ncycfg='ncycfgs' # Num commits yesterday in configs (bruh edition)
alias dfsp='dirfsp' # Dirfsp shorthand
alias rmrsc='rm -f ~/.restartssincecleanup' # Remov e the restarts since cleanup file
alias grncfg='grep -rn $HOME/configs -e' # gren -rn in configs dir
alias mtctl='~/configs/mathtestctl.py' # Math test control
alias mctcl='mtctl' # Musspell
alias dwpms='~/desktop-wallpaper/make-symlinks.sh' # Make desktop wallpaper symlinks
alias please-change-my-wallpaper-right-now-ok='sudo systemctl start changewallpaper.service' # change wallpaper right now ok
alias avgsizefiles="find './' -maxdepth 1 -ls | awk '{sum += \$7; n++;} END {printf \"%.0f\", sum/n;}' | numfmt --to=iec-i && echo && true" # get the average size of files rn
alias echowinep='echo $WINEPREFIX' # Print the wineprefix to make sure im in the right one
alias aliias='alias' # Alies
alias smd='sudo mkdir' # Create dir as superuser
alias r.='cd "$(readlink -m "$(pwd)")"' # go to the real current directory like if ur in a directory thats a symlink
alias clipfile='xclip -selection c <' # Copy file to clipboard
alias sug='sudo update-grub' # Do you even KNOW how much time this saves???
alias badwifiwget='wget -c --tries=0 --retry-connrefused --timeout=2 --wait=1' # sauce: https://www.schmidp.com/2009/03/03/downloading-a-file-over-an-unstable-connection-with-wget/
alias jjar='java -jar' # cacao
alias ssctl='sudo systemctl' # Less typing more sudo rm -rf / --no-preserve-root
alias ssdrsma='sudo systemctl daemon-reload && sudo mount -a' # remount shit
alias hl='history | less' # h(istory) l(ess)
alias mannp='man -P cat' # man no pager
alias run-updater='~/configs/updater.sh' # Run configs updater
alias sefsa='sudo exportfs -a' # Network file system moment
alias srd='sudo rmdir' # Remove dir as superuser
alias mdp='mkdir -p' # ok
alias cmb.='cmake --build .' # build here
alias cmcb.='cmake --build . --target clean && cmake --build .' # clean then build here
alias grepba='grep ~/configs/.bash_aliases -n -e' # grep bash aliases
alias grepbf='grep ~/configs/.bash_functions -n -e' # grep bash functions
alias grepbrc='grep ~/.bashrc -n -e' # grep bashrc
alias who-the-HELL-is-using-my-wifi='sudo nethogs' # who the HELL is using my wifi??????
alias sudo='sudo -p "$(randomsudoprompt)"' # super user do
alias djrs='./manage.py runserver' # Run django server
alias grntodo='grn2do' # Just like
alias gren='grep' # I keep misspelling it.
alias convert='magick' # Nuh uh imv7
alias wpf.='export WINEPREFIX=$(pwd)' # wine prefix in current folder
alias sse0='sudo setenforce 0' # this alias and the one below it stem from me using docker which doesn't work if selinux enabled
alias sse1='sudo setenforce 1' # i dont know why
alias :wq='exit' # uohh
alias :qa='exit' # hair ornament
alias c-='cd -' # go back
alias speedtest-cli='speedtest-cli --secure' # always forgor
alias edtmod='vim ~/configs/module' # edit module (opens the file explorer thingie)
alias edtba='vim ~/configs/module/aliases' # edit aliases
alias edtbrcmod='vim ~/configs/module/rc' # edit brc module
alias upgrade-pip='pip install --upgrade pip' # upgrade pip
alias rebuild-kernel='sudo emerge --ask sys-kernel/gentoo-kernel' # utility alias for rebuilding kernel after changing config
alias pcpp='playerctl play-pause' # play/pause music
alias pcnx='playerctl next' # go to next track
alias pcpr='playerctl previous' # go to previous track
