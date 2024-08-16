# vim:foldmethod=marker
# shellcheck shell=bash
# shellcheck disable=SC2142
# Moltony's Bash Aliases

# Error handling {{{

BashAliasesNumErrors=0

baerrorhdlr() {
    echo " ! Alias Init error on line $1"
    ((BashAliasesNumErrors++))
}

trap 'baerrorhdlr $LINENO' ERR

# }}}

# Manual aliases {{{

# Basic aliases {{{

# this is a mess

alias rm='rm -iv' # Remove a file (verbose + confirm)
alias cp='cp -v' # Copy a file (verbose)
alias mv='mv -v' # Move a file (verbose)
alias mkdir='mkdir -v' # Create a directory (verbose)
alias rmdir='rmdir -v' # Remove a directory (verbose)
alias md='mkdir' # DOS-inspired shortcut for mkdir
alias rd='rmdir' # DOS-inspired shortcut for rmdir
alias cls='echo "Tip: press C-l to clear."' # C-l
alias reload-bashrc='source ~/.bashrc' # Reload BashRC
alias reload-bashaliases='echo "Reloading aliases." && source ~/.bash-configs/.bash_aliases && echo "Done." && trap - ERR' # Reload Bash aliases
alias reload-bashfuncs='echo "Reloading functions." && source ~/.bash-configs/.bash_functions && echo "Done." && trap - ERR' # Reload Bash functions
alias lt='ls -lh --size -1 -S --classify' # ll + sort by size
alias mnt="mount | awk -F ' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort" # Show mounted disks (no stuff like tmpfs or whatever)
alias grephist='history | grep' # Search in comman history
alias lq='ls -tl -1' # List contents of dir, sort files by modification time and do a one-column display
alias lqa='la -tl -1' # Same as lq but also show hidden files (including . and ..)
alias cppb='rsync -ah --info=progress2' # Copy with a neat little progress par
alias relbrc='reload-bashrc' # Short reload-bashrc alias
alias relba='reload-bashaliases' # Short reload-bashaliases alias
alias relbf='reload-bashfuncs' # Short reload-bashfuncs alias
alias hd='hexdump -C' # Hexdump but pretty (the hd binary is not in every distro)
alias mkaur='makepkg -si --noconfirm' # Make an AUR package
alias mk='make' # make but short (i forgor about this one since `make` is short enough anyway)
alias reboot='sudo reboot' # Reboot the computer
alias freespc='df -h --total -x tmpfs -x efivarfs' # Check free space on the disk
alias doxy='doxygen' # I'm too lazy to type 3 more characters
alias h='history' # h(istory)
alias shutdown='sudo shutdown now' # Shutdown NOW!
alias syncrbrc='synccfgs && relbrc' # Sync configs, reload bashrc
alias ysnc='yay -S --noconfirm' # Install AUR package with yay
alias ysyu='yay -Syu --noconfirm' # Update AUR packages with yay
alias yrnc='yay -R --noconfirm' # Say pai pai to AUR package
alias htop='btop' # btop is objectovely better
alias srbrc='syncrbrc' # Wait this exists??? omg i forgor tbh
alias scfgs='synccfgs' # Sync configs but the short version for literally no reason
alias math='bc -l' # Bring up a calculator
alias weather='curl wttr.in/Shymkent' # View weather (for Shymkent)
alias l.='ls -d .* --color=auto' # List only hidden files
alias ghs='grephist' # grephist short edition
alias ping='ping -c 5' # make ping stop after like 5 times that it pinged
alias ln='ln -iv' # ln but yo need to confirm and also verboosey
alias i-am-root='sudo -i' # i am root
alias wget='wget -c' # Wget continue if stopped for whatever reason
alias gaming='cdgam' # Go to folder with GAMING
alias gaming-b='bcdgam' # gaming (builtin cd edition)
alias syncpaipai='synccfgs && paipai' # Sync configs and say pai pai
alias spaipai='syncpaipai' # Today's installment of Useless Aliases... Short version of `syncpaipai' !!!
alias scfgsm='synccfgsm' # Short versoin alias thing ojgjo2joejfjojii243jrjoo2 2323oin23roin23r
alias syncmrbrc='synccfgsm && relbrc' # Sync configs with message and rbrc TODO turn this into a function
alias syncmrba='synccfgsm && relba' # Sync configs with message and rba TODO function
alias syncmrbf='synccfgsm && relbf' # Sync configs with message and rbf TODO function
alias syncmpaipai='synccfgsm && paipai' # Sync configs with message and paipai
alias saiy='sudo apt install -y' # Install p
alias sary='sudo apt remove -y' # Rm p
alias saud='sudo apt update' # Upd ps
alias saug='sudo apt upgrade' # Upg ps
alias pshcfgspaipai='pshcfgs && paipai' # Push cfgs and paipia
alias wine64='WINEPREFIX=~/.wine64 wine64' # Convenience: start Wine with the 64-bit prefix
alias wine64cfg='WINEPREFIX=~/.wine64 winecfg' # Convenience 2: configure Wine with the 64-bit prefiix
alias gaming-th='cdth' # touhou
alias gaming-thu='cdthu' # Touhou utilities like thscorefileconveretr
alias thprefix='export WINEPREFIX=$HOME/Games/TouhouShared'
alias catlessbf='catbf | less' # catbf with pager
alias dirfspraw='du --max-depth=1 -h --all' # Analyze free space in directory (no sort)
alias dirfsp='dirfspraw | sort -h' # Analyze free space in directory
alias diurfsp='dirfsp' # are yuru happy do yuru happy aikotoba honjitsu no dokidoki sutekina happy day hajimemashou chuu chuu chuu chuu chuu la la
alias grn='grep -Irn' # Shortcut for grep -rn
alias rmhsl='rm ~/configs/HourlySyncLogs -rf' # Remove hourly config sync logs
alias rmun='find . -name "*.un~" -exec rm -f {} +' # Remove annoying Vim backup files
alias rf='rm -rf' # h
alias wine64tricks='WINEPREFIX=~/.wine64 winetricks' # Winetricks in 64-bit prefix
alias thu='thunar' # Shorthand for thunar
alias thubkmk='thu ~/Bookmarks &' # Start Thunar in the bookmarks folder
alias grgpll='gr. && gpll' # Remove all local changes and pull
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
alias hcse='hcs-enable' # Enable HCS
alias hcsd='hcs-disable' # Disable HCS
alias hcsie='hcs-is-enabled' # Check if HCS is enabled
alias ffwcfg='fastfetch -c $HOME/configs/fastfetch-cfg.jsonc' # Run fastfetch with custom config
alias rbrc='relbrc' # Less typing
alias rba='relba' # Even less typing
alias rbf='relbf' # Least typing
alias paixorg='sudo pkill -9 Xorg' # kill xorg with ease
alias xlogout='sudo pkill -u $USER' # Log out
alias aptrepos='grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*' # List apt repos
alias dfs='dirfsp' # less typing less hedayhce
alias ls='ls -CF --color=auto' # ls but with the little asterisk afte rht executables and slash after folders and shit
alias ll='\ls -alF --color=auto' # ls with the list thing
alias la='ls -A --color=auto' # ls but show hidden
alias l='ls' # me when the backwards compatibility
alias lal='\ls -CFA --color=auto' # l and la combined
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias updrbrc='updcfgs && rbrc' # Update configs and then reload bashrc
alias prettyjson='python -m json.tool' # Prettify json with a single, easy-to-remember command(tm)!
alias gshwh='gshh' # In case i forgor
alias areconf='autoreconf --verbose --install --force' # Autorceonf
alias chx='chmod +x' # Too tired of chmod +x so i shorten it
alias banger='sudo aplay /dev/mem' # PLAY THIS ABSOLUTE BANGER!!!
alias nctcfg='nctcfgs' # Num commits today in configs (bruh edition)
alias ncycfg='ncycfgs' # Num commits yesterday in configs (bruh edition)
alias dfsp='dirfsp' # Dirfsp shorthand
alias rmrsc='rm -f ~/.restartssincecleanup' # Remov e the restarts since cleanup file
alias grncfg='grep -rn $HOME/configs -e' # gren -rn in configs dir
alias lsd='ls -d */' # Ls only dirs
alias mtctl='~/configs/mathtestctl.py' # Math test control
alias dwpms='~/desktop-wallpaper/make-symlinks.sh' # Make desktop wallpaper symlinks
alias please-change-my-wallpaper-right-now-ok='sudo systemctl start changewallpaper.service' # change wallpaper right now ok
alias pshcfgssf='pshcfgs && pshsf' # push configs and savefiles
alias avgsizefiles="find './' -maxdepth 1 -ls | awk '{sum += \$7; n++;} END {printf \"%.0f\", sum/n;}' | numfmt --to=iec-i && echo && true" # get the average size of files rn
alias sfabe='~/savefiles/autobackup.sh ENABLE' # Enable savefiles autobackup
alias sfabd='~/savefiles/autobackup.sh DISABLE' # Disable savefiles autobackup
alias echowinep='echo $WINEPREFIX' # Print the wineprefix to make sure im in the right one
alias aliias='alias' # Alies
alias debian-upgrade='sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y' # Update debian
alias smd='sudo mkdir' # Create dir as superuser
alias mntsdb='sudo mount /dev/sdb /mnt' # Mount sdb
alias mntsdb1='sudo mount /dev/sdb1 /mnt' # Mount sdb1
alias mntsdb2='sudo mount /dev/sdb2 /mnt' # Mount sdb2 (TODO more sdbs and also sdc sdd)
alias ejsdb='sudo eject /dev/sdb' # eject sdb
alias r.='cd $(readlink -m $(pwd))' # go to the real current directory like if ur in a directory thats a symlink
alias clipfile='xclip -selection c <' # Copy file to clipboard
alias sug='sudo update-grub' # Do you even KNOW how much time this saves???
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"' # XDG ninja suggested this
alias adb='HOME="$XDG_DATA_HOME"/android adb' # adb but xdg
alias badwifiwget='wget -c --tries=0 --retry-connrefused --timeout=2 --wait=1' # sauce: https://www.schmidp.com/2009/03/03/downloading-a-file-over-an-unstable-connection-with-wget/
alias jjar='java -jar' # cacao
alias ssctl='sudo systemctl' # Less typing more sudo rm -rf / --no-preserve-root
alias ssdrsma='sudo systemctl daemon-reload && sudo mount -a' # remount shit

# }}}

# .NET aliases {{{

alias dnbld='dotnet build -v n' # Build a .NET solution with normal verbosity
alias dnbuild='dnbld' # dnbld but less short
alias dnbldn='dotnet build -v n' # Build a .NET solution with normal verbosity (alt spelling)
alias dnbuildn='dnbldn' # dnbldn but less short
alias dnbldm='dotnet build -v m' # Build a .NET solution with minimal verbosity
alias dnbuildm='dnbldm' # dnbldm but less short
alias dnbldq='dotnet build -v q' # Build a .NET solution quietly
alias dnbuildq='dnbldq' # dnbldq but less short
alias dnbldd='dotnet build -v d' # Build a .NET solution with detailed verbosity
alias dnbuildd='dnbldd' # dnbldd but less short
alias dnblddg='dotnet build -v diag' # Build a .NET solution VERY FRICKING LOUDLY!!!
alias dnbuilddg='dnblddg' # dnblddg but less short
alias dnblddiag='dnblddg' # alt spellig
alias dnbuilddiag='dnblddg' # another alt spelling
alias dnrun='dotnet run -v n' # Run a .NET solution with normal verbosity
alias dnrunn='dotnet run -v n' # because why not
alias dnrunm='dotnet run -v m' # Run a .NET solution with minimal verbosity
alias dnrunq='dotnet run -v q' # Run a .NET solution quietly
alias dnrunq='dotnet run -v d' # Run a .NET solution with detailed verbosity
alias dnrunq='dotnet run -v diag' # Run a .NET solution VERY FRICKING LOUDLY!!!
alias dnrunnb='dnrun --no-build' # Run a .NET solution but no build
alias dnbuildrel='dotnet build -v n -c Release' # Build with release config
alias dnbldrel='dnbuildrel' # Yeah
alias dnrunrel='dotnet run -v n -c Release' # Run with release config
alias dnclean='dotnet clean -v n' # dotnet clean
alias dncln='dotnet clean -v n' # There is no reason for this to exist
alias dnfmt='dotnet format' # .NET formatting
alias dnme='dotnet mgcb-editor' # MGCB editor

# }}}

# Git aliases {{{

alias gpllsh='git pull && git push' # Pull'n'push
alias gplsh='gpllsh' # Pul'n'push
alias plsh='gpllsh' # Pl'n'sh
alias cdgr='cd `git rev-parse --show-toplevel`' # Go to root of git repository
alias glog='git log' # Git log shortcut
alias gloga='git log --all' # git log shortcut for all branches
alias glg='glog' # glog but without the o
alias glga='gloga' # gloga w/o o
alias todayscommits='glog --oneline --since=midnight' # Show all commits starting from midnight
alias numcommits='glog --oneline | wc -l' # Count total number of commits in the repo
alias numcommtoday='todayscommits | wc -l' # Count total number of commits that were created today in a repo
alias yesterdayscommits='glog --oneline --since=yesterday.midnight --until=midnight' # List all commits from yesterday
alias numcommyest='yesterdayscommits | wc -l' # Count total number of commits that were created yesterday in a repo
alias gcam='git commit -am' # do commit
alias gpsh='git push' # Push local changes to remote in git
alias gpsht='git push --tags' # Push local tags to remote in git
alias gpll='git pull' # Pull remote changes to local repo in git
alias gst='git status' # Status of the repo (git)
alias gftch='git fetch' # Fetch (git)
alias gcln='git clone' # Clone a repo (git)
alias gcfgg='git config --global' # Change/view global git configuration
alias gcfgun='gcfgg user.name' # Set user's name in git
alias gcfgue='gcfgg user.email' # Ser user's email git
alias gdff='git diff' # See the difference between local changes and last commit (git)
alias gshw='git show' # Show differences between commit and a commit before that
alias glogol='glog --oneline' # git log with each commit taking 1 line
alias glgol='glogol' # Short glogol
alias gr.='git restore .' # Remove local unstaged changes in current dir
alias grs='git restore' # Remove local unstaged changes (git)
alias ga.='git add .' # Stage local changes in cur. directory (git)
alias gdd='git add' # Stage local changes (git)
alias gcm='git commit -m' # Do a commit (git)
alias gcobj='git count-objects' # Count how many objects and how much the repo takes up (git)
alias glgolrv='glogol --reverse' # Git log one line but in reverse
alias gbch='git --no-pager branch' # Git branch
alias gbchvv='git --no-pager branch -vv' # Git branch with more info
alias gslog='git shortlog' # Git short log
alias pshpaipai='git push && paipai' # Git push and papiap
alias gshwnp='git --no-pager show' # Git show with no pager
alias gdffnp='git --no-pager diff' # git diff ith no pager
alias gundolc='git reset --soft HEAD^' # This is when i screw up
alias gundolchard='git reset --hard HEAD^' # This is when i really screw up
alias glgnp='git --no-pager log' # Git log with no pager
alias glgnpr='glgnp --reverse' # Git log no pager reverse
alias glgrnp='glgnpr' # Different spelling of the above alias
alias glognp='glgnp' # Git log no pager
alias glognpr='glgnpr' # Git log no pager reverse
alias glogrnp='glgnpr' # Git log reverse no pager
alias glogolnp='git --no-pager log --oneline' # Git log no pager oneline
alias glogolrnp='glogolnp --reverse' # Git log one one line no pager reverse
alias glogolnpr='glogolrnp' # Git log one line no pager reverse
alias glgolnp='glogolnp' # Git log one line no pager
alias glgolrnp='glogolrnp' # Git log one line reverse no pager
alias glogolnpr='glogolrnp' # Git log one line no pager reverse
alias gint='git init' # initialzie git repository
alias :G='git' # Git
alias gpshpaipai='gpsh && paipai' # Git push pai pai
alias gagcm='git add . && git commit -m' # Git add and commit
alias gshh='git show HEAD' # Show head
alias gshhnp='git --no-pager show HEAD' # Show head without pager
alias gcaaem='git commit -a --allow-empty-message' # Commit with empty message
alias glf='git ls-files' # List git files
alias i-forgor-submodules='git submodule update --init --recursive' # I FORGOR SUBMODULES!!!
alias glogrv='git log --reverse' # I cannot believe I'm only now adding this
alias glgrv='glogrv' # Like, could you believe it? I've had these aliases for over half a year, and still have not thought of a simple reverse-log alias?..
alias gsw='git switch' # switch to some branch idk
alias gswc='git switch -c' # Switch to some brach but like make it
alias gadbch="git fetch -p && LC_ALL=C git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs -r git branch -d" # Git auto delete branches
alias gpshf='git push --force' # Pushpushpush

# }}}

# Pacman aliases (Arch Linux) {{{

alias spsyu='sudo pacman -Syu --noconfirm --needed' # Update the system (arch linux)
alias spsnc='sudo pacman -S --noconfirm --needed' # Install a package (arch linux)
alias sprnc='sudo pacman -R --noconfirm' # Remove a package (arch linux)
alias spss='sudo pacman -Ss' # Search package (arch linux)
alias sprnsnc='sudo pacman -Rns --noconfirm' # Something about removing pacman package idk (arch linux)
alias spsc='sudo pacman -Sc --noconfirm' # I don't use arch anymore so can't say for sure (arch linux)
alias spsu='sudo pacman -Su --noconfirm' # Update but not download package lists (arch linuh)
alias archlnx-update='spsyu && ysyu' # Update normal pacman packages + aur (arch linux)
alias spsy='echo "no that would be stupid"' # This originally was an alias for `sudo pacman -Sy` but i heard that's bad (arch linux)

# }}}

# Zypper aliases (openSUSE) {{{

alias sziy='sudo zypper in -y' # install a package (openSUSE)
alias szry='sudo zypper rm -y' # Remove a package (openSUSE)
alias szdy='sudo zypper dup -y' # Distribution update (openSUSE)
alias szuy='sudo zypper up -y' # Update (openSUSE)

# }}}

# DNF aliases (Fedora) {{{

alias sdiy='sudo dnf install -y' # Install packag (Fedora)
alias sdi='sudo dnf install' # Install package but don't assume yeah (Fedoroao)
alias sdry='sudo dnf remove -y' # Remove package (fedora)
alias sdr='sudo dnf remove' # Remove package nbut no -y (feet dora)
alias sdary='sudo dnf autoremove -y' # Remove useless packages (fedora)
alias sdar='sudo dnf autoremove' # Remove useless packages but ask if u really wanna ('dora)
alias sdriy='sudo dnf reinstall -y' # Reinstall package (fedora)
alias sdri='sudo dnf reinstall' # Reinstall package but "are you ok???" (Fed Ora)
alias sduy='sudo dnf upgrade -y' # Update packages (fedora)
alias sdu='sudo dnf upgrade' # Update packages but don't think it's gonna let you off the hook so easily (Pandora)

# }}}

# Aliases related to vim in some way {{{

alias v='vim' # vim (I don't use this one xdddd)
alias nano='vim' # YEAHHHH!!!
alias emacs='vim' # EVEN MORE YEAHAAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAHAUHSWFJ2WJFWERDJRTMOIBRMLKRTMKPRPMKELMETNJDNJDRNJSNRGNOKFNMR M,S MO2N!!!!!1mu9m1MU(m91
alias code='vim' # Okay yeah I'm replacing every editor with vim
alias ee='vim' # I've used Easy Editor like once ever when I tried to use FreeBSD but failed
alias vi='vim' # iMprove Vi
alias gvim='vim' # gVim sucks anyway imo
alias :e='vim' # Another vim user HOW MANY VIM USERS DO WE HAVE
alias vimpi='vim +PlugInstall' # Install vim plugins
alias vimpu='vim +PlugUpdate' # Update vim plugins
alias vimpc='vim +PlugClean' # Clean vim plugins
alias svim='sudo vim' # Vim as superuser

# }}}

# Aliases for checking scripts using shellcheck {{{

alias chkbf='shellcheck --color=always ~/.bash-configs/.bash_functions | less' # Shellcheck bash functions
alias chkba='shellcheck --color=always ~/.bash-configs/.bash_aliases | less' # Shellcheck bash aliases
alias chkbrc='shellcheck --color=always ~/.bashrc | less' # Shellcheck bashrc
alias chkbfnc='shellcheck ~/.bash-configs/.bash_functions | less' # Shellcheck bash functions (no color)
alias chkbanc='shellcheck ~/.bash-configs/.bash_aliases | less' # Shellcheck bash aliases (no color)
alias chkbrcnc='shellcheck ~/.bashrc | less' # Shellcheck bashrc (no color)
alias chkbfnp='shellcheck --color=always ~/.bash-configs/.bash_functions' # Shellcheck bash functions (no pager)
alias chkbanp='shellcheck --color=always ~/.bash-configs/.bash_aliases' # Shellcheck bash aliases (no pager)
alias chkbrcnp='shellcheck --color=always ~/.bashrc' # Shellcheck bashrc (no pager)
alias chkbfnpc='shellcheck ~/.bash-configs/.bash_functions' # Shellcheck bash functions (no pager, no color)
alias chkbanpc='shellcheck ~/.bash-configs/.bash_aliases' # Shellcheck bash aliases (no pager, no color)
alias chkbrcnpc='shellcheck ~/.bashrc' # Shellcheck bashrc (no pager, no color)

# }}}

# Conditional aliases {{{

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh" # Cool kitty ssh alias (kitty exclusive)

# if ~/.pipbsp is there, default pip to pipbsp
if [ -f "$HOME/.pipbsp" ]; then
    alias pip='pipbsp'
fi

# WSL aliases {{{

if [ -f ~/imrunningonwsl ]; then
    alias mount-ubuntu='wsl.exe -d Ubuntu -u root mount --bind / /mnt/wsl/ubuntu' # Mount Ubuntu files
fi

# }}}

# }}}

# }}}

# Automatic aliases {{{

# Edit-cat aliases {{{

mkecalias brc ~/.bashrc
mkecalias ba ~/.bash-configs/.bash_aliases
mkecalias cp ~/.custompath
mkecalias cpath ~/.custompath
mkecalias bf ~/.bash-configs/.bash_functions
mkecalias vrc ~/.vimrc
mkecalias crc ~/.conkyrc
mkecalias cs ~/configs/cronsync.sh
mkecalias mssc ~/.mssc
mkecalias prf ~/.profile
mkecalias kc ~/.config/kitty/kitty.conf
mkecalias bd ~/.bday
mkecalias bday ~/.bday
mkecalias ffc ~/configs/fastfetch-cfg.jsonc
mkecalias i3 ~/.config/i3/config
mkecalias ct ~/.config/compton/compton.conf
mkecalias uba ~/.bash-configs/.useraliases
mkecalias ubf ~/.bash-configs/.userfunctions
mkecalias pyreq ./requirements.txt
mkecalias nsset ~/.local/share/nonoSharp/settings.json
mkecalias sfrdm ~/savefiles/README.md
mkecalias dwprdm ~/desktop-wallpaper/README.md
mkecalias nt ~/.local/share/notes/Notes/Notes
mkecalias rdm ./README.md
mkecalias obrc ~/.config/openbox/rc.xml
mkecalias obas ~/.config/openbox/autostart.sh
mkecalias cfgsrdm ~/configs/README.md
mkecalias gi ./.gitignore
mkecalias sfu ~/savefiles/user.json
mkecalias mpv ~/.config/mpv/mpv.conf
mkecalias gcf ~/.gitconfig
mkecalias mpvi ~/.config/mpv/input.conf

# }}}

# Super-user edit-cat aliases {{{

mksuecalias fs /etc/fstab
mksuecalias srcl /etc/apt/sources.list
mksuecalias sl /etc/apt/sources.list
mksuecalias smb /etc/samba/smb.conf
mksuecalias ru /etc/update-manager/release-upgrades
mksuecalias rfd /boot/efi/efi/refind/refind.conf
mksuecalias ldm /etc/lightdm/lightdm.conf
mksuecalias ldmg /etc/lightdm/lightdm-gtk-greeter.conf
mksuecalias edg /etc/default/grub
mksuecalias dnf /etc/dnf/dnf.conf

# }}}

# Exit aliases {{{

mkexitalias paipai
mkexitalias bye
mkexitalias byebye
mkexitalias baibai
mkexitalias :q
mkexitalias gtfo
mkexitalias piapia
mkexitalias pai
mkexitalias eedtba
mkexitalias rm-rol
mkexitalias rn-roll
mkexitalias exir
mkexitalias pia
mkexitalias qsqsqs
mkexitalias sl

# }}}

# `quit' misspellings {{{

mkexitalias quit
mkexitalias qiut
mkexitalias qtui
mkexitalias quti
mkexitalias qtiu
mkexitalias tqui
mkexitalias uiqt
mkexitalias uqti
mkexitalias qitu
mkexitalias utqi
mkexitalias itqu
mkexitalias iqtu
mkexitalias tqiu
mkexitalias tuqi
mkexitalias uitq
mkexitalias tiuq
mkexitalias iuqt
mkexitalias tiqu
mkexitalias tuiq
mkexitalias utiq
mkexitalias iqut
mkexitalias uqit
mkexitalias iutq
mkexitalias ituq
mkexitalias qui

# }}}

# Directory aliases {{{

# Common directory aliases {{{

mkcdiralias dl ~/Downloads
mkcdiralias doc ~/Documents
mkcdiralias mus ~/Music
mkcdiralias muslib ~/Music/music-lib
mkcdiralias ml ~/Music/music-lib
mkcdiralias muslibmus ~/Music/music-lib/music
mkcdiralias mlm ~/Music/music-lib/music
mkcdiralias pic ~/Pictures
mkcdiralias vid ~/Videos
mkcdiralias hsl ~/configs/HourlySyncLogs
mkcdiralias bm ~/Bookmarks
mkcdiralias bkmk ~/Bookmarks
mkcdiralias bk ~/Bookmarks
mkcdiralias and ~/Bookmarks/Android\ partition # L sand
mkcdiralias anime ~/Bookmarks/Anime
mkcdiralias animemov ~/Bookmarks/Anime/movies
mkcdiralias animeep ~/Bookmarks/Anime/episodes
mkcdiralias animesub ~/Bookmarks/Anime/subtitles
mkcdiralias cart ~/Bookmarks/Cartoons
mkcdiralias dlimg ~/Bookmarks/Downloaded\ images
mkcdiralias dli ~/Bookmarks/Downloaded\ images
mkcdiralias dlgames ~/Bookmarks/Game\ downloads
mkcdiralias dlg ~/Bookmarks/Game\ downloads
mkcdiralias dlgameswin ~/Bookmarks/Game\ downloads\ \(Windows\)
mkcdiralias dlgw ~/Bookmarks/Game\ downloads\ \(Windows\)
mkcdiralias dlgameslnx ~/Bookmarks/Game\ downloads\ \(Linux\)
mkcdiralias dlgl ~/Bookmarks/Game\ downloads\ \(Linux\)
mkcdiralias dlgamesth ~/Bookmarks/Game\ downloads\ \(Touhou\)
mkcdiralias dlgt ~/Bookmarks/Game\ downloads\ \(Touhou\)
mkcdiralias dlfonts ~/Bookmarks/Downloaded\ fonts
mkcdiralias emugames ~/Bookmarks/Games\ \(emulator\)
mkcdiralias iso ~/Bookmarks/ISOs
mkcdiralias dev ~/Bookmarks/Programming
mkcdiralias shot ~/Bookmarks/Screenshots
mkcdiralias ws ~/Bookmarks/Website
mkcdiralias web ~/Bookmarks/Website
mkcdiralias win ~/Bookmarks/Windows\ partition
mkcdiralias wine ~/Bookmarks/Wine
mkcdiralias wine64 ~/Bookmarks/Wine\ \(64-bit\)
mkcdiralias winep ~/Bookmarks/Wine\ prefixes
mkcdiralias book ~/Bookmarks/Books
mkcdiralias wp ~/Bookmarks/Wallpaper
mkcdiralias wpw ~/Bookmarks/Wallpaper\ \(working\ dir\)
mkcdiralias dos ~/Bookmarks/DOS\ files
mkcdiralias cam ~/Pictures/camera
mkcdiralias cfg ~/configs
mkcdiralias cfgs ~/configs
mkcdiralias cfgbin ~/configs/bin
mkcdiralias cfgsbin ~/configs/bin
mkcdiralias sysd /etc/systemd/
mkcdiralias sysdsys /etc/systemd/system
mkcdiralias mc ~/.minecraft
mkcdiralias mcw ~/.minecraft/saves
mkcdiralias mcrp ~/.minecraft/resourcepacks
mkcdiralias mcv ~/.minecraft/versions
mkcdiralias mcmod ~/.minecraft/mods
mkcdiralias mccr ~/.minecraft/crash-reports
mkcdiralias mcshot ~/.minecraft/screenshots
mkcdiralias sf ~/savefiles
mkcdiralias dwp ~/desktop-wallpaper
mkcdiralias car ~/Bookmarks/Cute\ anime\ art
mkcdiralias dlgth ~/Bookmarks/Game\ downloads\ \(Touhou\)
mkcdiralias anim ~/Bookmarks/Anime
mkcdiralias animmov ~/Bookmarks/Anime/movies
mkcdiralias animep ~/Bookmarks/Anime/episodes
mkcdiralias animsub ~/Bookmarks/Anime/subtitles
mkcdiralias ani ~/Bookmarks/Anime
mkcdiralias animov ~/Bookmarks/Anime/movies
mkcdiralias aniep ~/Bookmarks/Anime/episodes
mkcdiralias anisub ~/Bookmarks/Anime/subtitles
mkcdiralias gam ~/Games
mkcdiralias th ~/Games/TouhouShared/drive_c
mkcdiralias thu ~/Games/TouhouShared/drive_c/Touhou-Utilities
mkcdiralias sld /etc/apt/sources.list.d
mkcdiralias vm ~/VMs
mkcdiralias mpv ~/.config/mpv

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
mkcolorado fgrep
mkcolorado egrep

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

if [ -f "$HOME/.bash-configs/.useraliases" ]; then
    source "$HOME/.bash-configs/.useraliases"
fi

# }}}
