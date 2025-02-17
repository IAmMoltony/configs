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
alias convert='magick convert' # Nuh uh imv7
alias sdcu='sudo docker compose up' # start the docker thing
alias wpf.='export WINEPREFIX=$(pwd)' # wine prefix in current folder
alias sse0='sudo setenforce 0' # this alias and the one below it stem from me using docker which doesn't work if selinux enabled
alias sse1='sudo setenforce 1' # i dont know why

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
alias gftch='git fetch' # Fetch (git)
alias gcln='git clone' # Clone a repo (git)
alias gcfgg='git config --global' # Change/view global git configuration
alias gcfgun='gcfgg user.name' # Set user's name in git
alias gcfgue='gcfgg user.email' # Ser user's email git
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
alias gshwh='gshh' # In case i forgor
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
alias grgpll='gr. && gpll' # Remove all local changes and pull
alias gsw-='git switch -' # Switch to default branch
alias gplladbch='git pull && gadbch' # Pull and then auto-delete branches
alias gsw-plladbch='git switch - && gplladbch' # Switch to main branch, then pull, then auto-delete branches
alias gbchd='git branch -d' # Delete a branch
alias gbchdf='git branch -D' # Force delete a branch
alias gbchm='git branch -m' # Move/rename a branch
alias gbchmf='git branch -M' # Force move/rename a branch
alias gbchc='git branch -c' # Copy a branch
alias gbchcf='git branch -C' # Force copy a branch
alias gbcha='git branch -a' # List every branch ever
alias glgolth='glgth --oneline' # git log tag..HEAD one line
alias gchk='git checkout' # git checkout
alias gpog='git push origin' # git push to origin
alias gpgh='git push github' # git push to github
alias gpogmn='git push origin main' # git push main to origin
alias gpogms='git push origin master' # git push master to origin
alias gpghmn='git push github main' # git push main to github
alias gpghms='git push github master' # git push master to github
alias gfch='git log --follow -p --' # view commit history and diffs for file
alias gplogmn='git pull origin main' # git pull main to origin
alias gplogms='git pull origin master' # git pull master to origin
alias gplghmn='git pull github main' # git pull main to github
alias gplghms='git pull github master' # git pull master to github

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
alias sudy='sduy' # minor spelling mistake
alias sdu='sudo dnf upgrade' # Update packages but don't think it's gonna let you off the hook so easily (Pandora)
alias sdcp='sudo dnf clean packages' # Clean package cache (Fumofumo)
alias sdgiy='sudo dnf group install -y' # Install a package group (Feora)
alias sdgi='sudo dnf group install' # Install a package group. Make sure you do actually want it. (Dehors)
alias sdmc='sudo dnf makecache' # Make package cache (Insert word that sounds like "fedora" here)

# }}}

# APT aliases (Debian/Ubuntu/The 10 million other distros based on these two) {{{

alias saiy='sudo apt install -y' # Install p
alias sary='sudo apt remove -y' # Rm p
alias saud='sudo apt update' # Upd ps
alias saug='sudo apt upgrade' # Upg ps
alias aptrepos='grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*' # List apt repos
alias debian-upgrade='sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y' # Update debian

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

alias chkbf='shellcheck --color=always ~/configs/.bash_functions' # Shellcheck bash functions
alias chkba='shellcheck --color=always ~/configs/.bash_aliases' # Shellcheck bash aliases
alias chkbrc='shellcheck --color=always ~/.bashrc' # Shellcheck bashrc
alias chkubf='shellcheck --color=always ~/.config/bash-configs/userfunctions' # Shellcheck user functions
alias chkuba='shellcheck --color=always ~/.config/bash-configs/useraliases' # Shellcheck user aliases

# }}}

# ls variations {{{

alias lt='ls -lh --size -1 -S --classify' # ll + sort by size
alias lq='ls -tl -1' # List contents of dir, sort files by modification time and do a one-column display
alias lqa='la -tl -1' # Same as lq but also show hidden files (including . and ..)
alias l.='ls -d .* --color=auto' # List only hidden files
alias ls='ls -CF --color=auto' # ls but with the little asterisk afte rht executables and slash after folders and shit
alias ll='\ls -alF --color=auto' # ls with the list thing
alias la='ls -A --color=auto' # ls but show hidden
alias l='ls' # me when the backwards compatibility
alias lal='\ls -CFA --color=auto' # l and la combined
alias lsd='ls -d */' # Ls only dirs

# }}}

# Aliases for syncing configs {{{

alias syncrbrc='synccfgs && relbrc' # Sync configs, reload bashrc
alias srbrc='syncrbrc' # Wait this exists??? omg i forgor tbh
alias scfgs='synccfgs' # Sync configs but the short version for literally no reason
alias syncpaipai='synccfgs && paipai' # Sync configs and say pai pai
alias spaipai='syncpaipai' # Today's installment of Useless Aliases... Short version of `syncpaipai' !!!
alias scfgsm='synccfgsm' # Short versoin alias thing ojgjo2joejfjojii243jrjoo2 2323oin23roin23r
alias syncmrbabf='syncmrbfba' # Same as above but like (bf needs to be source before ba so same)

# }}}

# `quit' misspellings {{{

alias quit='exit'
alias qiut='exit'
alias qtui='exit'
alias quti='exit'
alias qtiu='exit'
alias tqui='exit'
alias uiqt='exit'
alias uqti='exit'
alias qitu='exit'
alias utqi='exit'
alias itqu='exit'
alias iqtu='exit'
alias tqiu='exit'
alias tuqi='exit'
alias uitq='exit'
alias tiuq='exit'
alias iuqt='exit'
alias tiqu='exit'
alias tuiq='exit'
alias utiq='exit'
alias iqut='exit'
alias uqit='exit'
alias iutq='exit'
alias ituq='exit'
alias qito='exit'
alias qui='exit'

# }}}

# Conditional aliases {{{

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh" # Cool kitty ssh alias (kitty exclusive)

# if ~/.pipbsp is there, default pip to pipbsp
if [ -f "$HOME/.pipbsp" ]; then
    alias pip='pipbsp'
fi

# if btop is installed, replace htop with btop
if command -v btop >/dev/null 2>&1; then
    alias htop='btop'
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
mkecalias ba ~/configs/.bash_aliases
mkecalias cp ~/.custompath
mkecalias cpath ~/.custompath
mkecalias bf ~/configs/.bash_functions
mkecalias vrc ~/.vimrc
mkecalias crc ~/.config/conky/conky.conf
mkecalias cs ~/configs/cronsync.sh
mkecalias mssc ~/.mssc
mkecalias prf ~/.profile
mkecalias kc ~/.config/kitty/kitty.conf
mkecalias ffc ~/configs/fastfetch-cfg.jsonc
mkecalias i3 ~/.config/i3/config
mkecalias ct ~/.config/compton/compton.conf
mkecalias uba ~/.config/bash-configs/useraliases
mkecalias ubf ~/.config/bash-configs/userfunctions
mkecalias pyreq ./requirements.txt
mkecalias nsset ~/.local/share/nonoSharp/settings.json
mkecalias dwprdm ~/desktop-wallpaper/README.md
mkecalias nt ~/.local/share/notes/Notes/Notes
mkecalias rdm ./README.md
mkecalias obrc ~/.config/openbox/rc.xml
mkecalias obas ~/.config/openbox/autostart.sh
mkecalias cfgsrdm ~/configs/README.md
mkecalias gi ./.gitignore
mkecalias mpv ~/.config/mpv/mpv.conf
mkecalias gcf ~/.config/git/config
mkecalias mpvi ~/.config/mpv/input.conf
mkecalias mpvsc ~/configs/mpv-slowcomputer.conf
mkecalias mpvfc ~/configs/mpv-fastcomputer.conf
mkecalias mpvc ~/configs/mpv-common.conf
mkecalias gitcredentials ~/.git-credentials # the reason this alias has such a long name is because it's not meant to be used often and accident-proof
mkecalias cml ./CMakeLists.txt

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
mksuecalias exp /etc/exports
mksuecalias hsts /etc/hosts

# }}}

# Directory aliases {{{

# Common directory aliases {{{

mkcdiralias dl ~/Downloads
mkcdiralias doc ~/Documents
mkcdiralias mus ~/Music
mkcdiralias pic ~/Pictures
mkcdiralias vid ~/Videos
mkcdiralias hsl ~/configs/HourlySyncLogs
mkcdiralias cam ~/Pictures/camera
mkcdiralias cfg ~/configs
mkcdiralias cfgs ~/configs
mkcdiralias cfgbin ~/configs/bin
mkcdiralias cfgsbin ~/configs/bin
mkcdiralias sysd /etc/systemd/
mkcdiralias sysdsys /etc/systemd/system
mkcdiralias dwp ~/desktop-wallpaper
mkcdiralias gam ~/Games
mkcdiralias th ~/Games/TouhouShared/drive_c
mkcdiralias thu ~/Games/TouhouShared/drive_c/Touhou-Utilities
mkcdiralias sld /etc/apt/sources.list.d
mkcdiralias vm ~/VMs
mkcdiralias mpv ~/.config/mpv
mkcdiralias mpvs ~/.config/mpv/scripts
mkcdiralias ansdk ~/Android/Sdk
mkcdiralias zim ~/Notebooks

# music-lib {{{

mkcdiralias muslib ~/Music/music-lib
mkcdiralias ml ~/Music/music-lib
mkcdiralias muslibmus ~/Music/music-lib/music
mkcdiralias mlm ~/Music/music-lib/music

# }}}

# Bookmarks {{{

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
mkcdiralias dlgth ~/Bookmarks/Game\ downloads\ \(Touhou\)
mkcdiralias anim ~/Bookmarks/Anime
mkcdiralias animmov ~/Bookmarks/Anime/movies
mkcdiralias animep ~/Bookmarks/Anime/episodes
mkcdiralias animsub ~/Bookmarks/Anime/subtitles
mkcdiralias ani ~/Bookmarks/Anime
mkcdiralias animov ~/Bookmarks/Anime/movies
mkcdiralias aniep ~/Bookmarks/Anime/episodes
mkcdiralias anisub ~/Bookmarks/Anime/subtitles

# }}}

# Minecraft {{{

mkcdiralias mc ~/.minecraft
mkcdiralias mcw ~/.minecraft/saves
mkcdiralias mcrp ~/.minecraft/resourcepacks
mkcdiralias mcv ~/.minecraft/versions
mkcdiralias mcmod ~/.minecraft/mods
mkcdiralias mccr ~/.minecraft/crash-reports
mkcdiralias mcshot ~/.minecraft/screenshots

# }}}

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
