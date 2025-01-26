# vim:foldmethod=marker
# shellcheck shell=bash
# shellcheck disable=SC2142
# Moltony's Bash Aliases

export BashAliasesStartTime=$(date +%s.%N)

# Error handling {{{

BashAliasesNumErrors=0

# TODO unset error handler when reloading ba/bf

baerrorhdlr() {
    echo " ! Alias Init error on line $1"
    ((BashAliasesNumErrors++))
}

trap 'baerrorhdlr $LINENO' ERR

# }}}

# Manual aliases {{{

# Miscellaneous aliases {{{

# this is a mess

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
alias hd='hexdump -C' # Hexdump but pretty (the hd binary is not in every distro)
alias mkaur='makepkg -si --noconfirm' # Make an AUR package
alias reboot='sudo reboot' # Reboot the computer
alias freespc='df -h --total -x tmpfs -x efivarfs -x devtmpfs' # Check free space on the disk
alias doxy='doxygen' # I'm too lazy to type 3 more characters
alias h='history' # h(istory)
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
alias restoreresolution='xrandr -s 1366x768' # Restore screen resolution
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
alias paixorg='sudo pkill -9 Xorg' # kill xorg with ease
alias xlogout='sudo pkill -u $USER' # Log out (TODO does this work on wayland? i dont feel like logging out rn so i'll check later)
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

# }}}

# parent directory {{{

mkcdiralias .. ..
mkdiralias .. l.. s.. c.. cf.. cr.. a.. ..
mkdiralias .... l.... s.... c.... cf.... cr.... a.... ../..
mkdiralias ...... l...... s...... c...... cf...... cr...... a...... ../../../
mkdiralias ........ l........ s........ c........ cf........ cr........ a........ ../../../..
mkdiralias .......... l.......... s.......... c.......... cf.......... cr.......... a.......... ../../../../..

# }}}

# }}}

# --color=auto (colorado) aliases {{{

mkcolorado dir
mkcolorado vdir
mkcolorado grep

# }}}

# XTerm fixes {{{

mkxtfalias mdless
mkxtfalias vim # Don't think this really fixes my issue :| bruh

# }}}

# }}}

# Trolling!! HAHA LOL LMAO KEK XD UwU {{{

rm-roll() {
    alias rm='rm -iv'
    ((RANDOM % 100 < 20)) && {
        alias rm='echo -e "Sorry I dozed off a bit, try again" && true'
    }
    true
}

# }}}

# User aliases (Aliases specific to the user, not synced to the github repo) {{{

ubaerrorhdlr() {
    echo " ! User Alias Init error on line $1"
    ((BashAliasesNumErrors++))
}

trap 'ubaerrorhdlr $LINENO' ERR

# Migration from old user aliases location
if [ -f "$HOME/.bash-configs/.useraliases" ]; then
    \mv "$HOME/.bash-configs/.useraliases" "$HOME/.config/bash-configs/useraliases"
fi

if [ -f "$HOME/.config/bash-configs/useraliases" ]; then
    source "$HOME/.config/bash-configs/useraliases"
fi

# }}}

# Completion {{{

# thank you chat jippity for the codez

_ssctl_lazy_load_completion() {
    if [ -f "/usr/share/bash-completion/completions/systemctl" ]; then
        source /usr/share/bash-completion/completions/systemctl
        complete -F _systemctl ssctl
        unset -f _ssctl_lazy_load_completion
    fi
}

complete -F _ssctl_lazy_load_completion ssctl

# }}}

export BashAliasesEndTime=$(date +%s.%N)
