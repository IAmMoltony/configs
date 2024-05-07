# vim:foldmethod=marker
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

alias rm='rm -iv' # Remove a file (verbose + confirm)
alias cp='cp -v' # Copy a file (verbose)
alias mv='mv -v' # Move a file (verbose)
alias mkdir='mkdir -v' # Create a directory (verbose)
alias rmdir='rmdir -v' # Remove a directory (verbose)
alias md='mkdir' # DOS-inspired shortcut for mkdir
alias rd='rmdir' # DOS-inspired shortcut for rmdir
alias cls='echo "Tip: press C-l to clear."' # C-l
alias reload-bashrc='source ~/.bashrc' # Reload BashRC
alias pullsh='git pull && git push' # Pull'n'push
alias lt='ls -lh --size -1 -S --classify' # ll + sort by size
alias mnt="mount | awk -F ' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort" # Show mounted disks (no stuff like tmpfs or whatever)
alias grephist='history | grep' # Search in comman history
alias lq='ls -tl -1' # List contents of dir, sort files by modification time and do a one-column display
alias lqa='la -tl -1' # Same as lq but also show hidden files (including . and ..)
alias cppb='rsync -ah --info=progress2' # Copy with a neat little progress par
alias cdgr='cd `git rev-parse --show-toplevel`' # Go to root of git repository
alias glog='git log' # Git log shortcut
alias gloga='git log --all' # git log shortcut for all branches
alias glg='glog' # glog but without the o
alias glga='gloga' # gloga w/o o
alias todayscommits='glog --oneline --since=midnight' # Show all commits starting from midnight
alias numcommits='glog --oneline | wc -l' # Count total number of commits in the repo
alias numcommtoday='todayscommits | wc -l' # Count total number of commits that were created today in a repo
alias relbrc='reload-bashrc' # Short reload-bashrc alias
alias spsyu='sudo pacman -Syu --noconfirm --needed' # Update the system (arch linux)
alias spsnc='sudo pacman -S --noconfirm --needed' # Install a package (arch linux)
alias sprnc='sudo pacman -R --noconfirm' # Remove a package (arch linux)
alias spss='sudo pacman -Ss' # Search package (arch linux)
alias sprnsnc='sudo pacman -Rns --noconfirm' # Something about removing pacman package idk (arch linux)
alias hd='hexdump -C' # Hexdump but pretty (this isn't in arch linux the last time i checked)
alias mkaur='makepkg -si --noconfirm' # Make an AUR package
alias gcam='git commit -am' # do commit
alias gpsh='git push' # Push local changes to remote in git
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
alias mk='make' # make but short (i forgor about this one since `make` is short enough anyway)
alias ga.='git add .' # Stage local changes in cur. directory (git)
alias gdd='git add' # Stage local changes (git)
alias gcm='git commit -m' # Do a commit (git)
alias reboot='sudo reboot' # Reboot the computer
alias freespc='df -h --total -x tmpfs -x efivarfs' # Check free space on the disk
alias spsc='sudo pacman -Sc --noconfirm' # I don't use arch anymore so can't say for sure
alias doxy='doxygen' # I'm too lazy to type 3 more characters
alias h='history' # h(istory)
alias shutdown='sudo shutdown now' # Shutdown NOW!
alias syncrbrc='synccfgs && relbrc' # Sync configs, reload bashrc
alias gcobj='git count-objects' # Count how many objects and how much the repo takes up (git)
alias spsu='sudo pacman -Su --noconfirm' # Update but not download package lists (arch linuh)
alias glgolrv='glogol --reverse' # Git log one line but in reverse
alias ysnc='yay -S --noconfirm' # Install AUR package with yay
alias ysyu='yay -Syu --noconfirm' # Update AUR packages with yay
alias archlnx-update='spsyu && ysyu' # Update normal pacman packages + aur
alias yrnc='yay -R --noconfirm' # Say pai pai to AUR package
alias v='vim' # vim (I don't use this one xdddd)
alias plsh='pullsh' # Pullsh but shorter
alias spsy='echo "no that would be stupid"' # This originally was an alias for `sudo pacman -Sy` but i heard that's bad
alias dnbld='dotnet build -v n' # Build a .NET solution with normal verbosity
alias dnrun='dotnet run -v n' # Run a .NET solution with normal verbosity
alias htop='btop' # btop is objectovely better
alias srbrc='syncrbrc' # Wait this exists??? omg i forgor tbh
alias scfgs='synccfgs' # Sync configs but the short version for literally no reason
alias math='bc -l' # Bring up a calculator
alias weather='curl wttr.in/Shymkent' # View weather (for Shymkent)
alias l.='ls -d .* --color=auto' # List only hidden files
alias ghs='grephist' # grephist short edition
alias nano='vim' # YEAHHHH!!!
alias emacs='vim' # EVEN MORE YEAHAAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAHAUHSWFJ2WJFWERDJRTMOIBRMLKRTMKPRPMKELMETNJDNJDRNJSNRGNOKFNMR M,S MO2N!!!!!1mu9m1MU(m91
alias code='vim' # Okay yeah I'm replacing every editor with vim
alias ee='vim' # I've used Easy Editor like once ever on BSD
alias vi='vim' # iMprove Vi
alias gvim='vim' # gVim sucks anyway imo
alias ping='ping -c 5' # make ping stop after like 5 times that it pinged
alias ln='ln -iv' # ln but yo need to confirm and also verboosey
alias i-am-root='sudo -i' # i am root
alias wget='wget -c' # Wget continue if stopped for whatever reason
alias gaming='cd ~/Games' # Go to folder with GAMING
alias gaming-b='builtin cd ~/Games' # gaming (builtin cd edition)
alias syncpaipai='synccfgs && paipai' # Sync configs and say pai pai
alias spaipai='syncpaipai' # Today's installment of Useless Aliases... Short version of `syncpaipai' !!!
alias scfgsm='synccfgsm' # Short versoin alias thing ojgjo2joejfjojii243jrjoo2 2323oin23roin23r
alias syncmrbrc='synccfgsm && relbrc' # Sync configs with message and rbrc
alias syncmpaipai='synccfgsm && paipai' # Sync configs with message and paipai
alias saiy='sudo apt install -y' # Install p
alias sary='sudo apt remove -y' # Rm p
alias saud='sudo apt update' # Upd ps
alias saug='sudo apt upgrade' # Upg ps
alias lsdl='ls ~/Downloads' # List ownload
alias pshcfgspaipai='pshcfgs && paipai' # Push cfgs and paipia
alias gbch='git branch' # Git branch
alias gslog='git shortlog' # Git short log
alias :e='vim' # Another vim user HOW MANY VIM USERS DO WE HAVE
alias pshpaipai='git push && paipai' # Git push and papiap
alias wine64='WINEPREFIX=~/.wine64 wine64' # Convenience: start Wine with the 64-bit prefix
alias dlmuspaipai='dlmus && paipai' # Download music aand then pai pai
alias gshwnp='git --no-pager show' # Git show with no pager
alias gaming-th='gaming-b && cd ./TouhouShared/drive_c' # touhou
alias gdffnp='git --no-pager diff' # git diff ith no pager
alias gundolc='git reset --soft HEAD^' # This is when i screw up
alias gundolchard='git reset --hard HEAD^' # This is when i really screw up
alias thprefix='export WINEPREFIX=$HOME/Games/TouhouShared'
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
alias dnbuildrel='dotnet build -v n -c Release' # Build with release config
alias dnrunrel='dotnet run -v n -c Release' # Run with release config
alias catlessbf='catbf | less' # catbf with pager
alias gint='git init' # initialzie git repository
alias vimpi='vim +PlugInstall' # Install vim plugins
alias vimpu='vim +PlugUpdate' # Update vim plugins
alias :G='git' # Git
alias vimpc='vim +PlugClean' # Clean vim plugins
alias dirfspraw='du --max-depth=1 -h --all' # Analyze free space in directory (no sort)
alias dirfsp='dirfspraw | sort -h' # Analyze free space in directory
alias grn='grep -Irn' # Shortcut for grep -rn
alias grn2do='grn . -e TODO' # Find TODOs *ds-craft flashbacks*
alias rmhsl='rm ~/configs/HourlySyncLogs -rf' # Remove hourly config sync logs
alias rmun='find . -name "*.un~" -exec rm -f {} +' # Remove annoying Vim backup files
alias gpshpaipai='gpsh && paipai' # Git push pai pai
alias gagcm='git add . && git commit -m' # Git add and commit
alias rf='rm -rf' # h
alias gshh='git show HEAD' # Show head
alias gshhnp='git --no-pager show HEAD' # Show head without pager
alias dnclean='dotnet clean -v n' # dotnet clean
alias wine64tricks='WINEPREFIX=~/.wine64 winetricks' # Winetricks in 64-bit prefix
alias thu='thunar' # Shorthand for thunar
alias thubkmk='thu ~/Bookmarks &' # Start Thunar in the bookmarks folder
alias grgpll='gr. && gpll' # Remove all local changes and pull
alias gcaaem='git commit -a --allow-empty-message' # Commit with empty message
alias restoreresolution='xrandr -s 1366x768' # Restore screen resolution
alias glf='git ls-files' # List git files
alias care='love .' # Start love2d
alias dlmus='~/Music/music-lib/download' # Download music
alias redlmus='~/Music/music-lib/redownload' # Re-download music
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
alias paixorg='sudo pkill -9 Xorg' # kill xorg with ease
alias xlogout='sudo pkill -u $USER' # Log out
alias aptrepos='grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*' # List apt repos
alias dfs='dirfsp' # less typing less hedayhce
alias ll='ls -alF' # ls with the list thing
alias la='ls -A' # ls but show hidden
alias l='ls -CF' # show the like executables with the little asterisk and when the directory the little slash ykwim
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias updrbrc='updcfgs && rbrc' # Update configs and then reload bashrc
alias prettyjson='python -m json.tool' # Prettify json with a single, easy-to-remember command(tm)!

# }}}

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh" # Cool kitty ssh alias (kitty exclusive)

# Automatic aliases: edit-cat aliases {{{

mkecalias bashrc brc ~/.bashrc
mkecalias bashaliases ba ~/.bash-configs/.bash_aliases
mkecalias custompath cp ~/.custompath
mkecalias custompath cpath ~/.custompath
mkecalias bashfuncs bf ~/.bash-configs/.bash_functions
mkecalias vimrc vrc ~/.vimrc
mkecalias conkyrc crc ~/.conkyrc
mkecalias cronsync cs ~/configs/cronsync.sh
mkecalias machinespecificstartupcommands mssc ~/.mssc
mkecalias diareplacement dr ~/Documents/DiaReplacement.txt
mkecalias profile prf ~/.profile
mkecalias kittyconf kc ~/.config/kitty/kitty.conf
mkecalias birthday bd ~/.bday
mkecalias fastfetchcfg ffc ~/configs/fastfetch-cfg.jsonc
mkecalias i3config i3 ~/.config/i3/config
mkecalias comptoncfg ct ~/.config/compton/compton.conf

# }}}

# Automatic aliases: super-user edit-cat aliases {{{

mksuecalias fstab fs /etc/fstab
mksuecalias sourceslist srcl /etc/apt/sources.list
mksuecalias sourceslist sl /etc/apt/sources.list
mksuecalias samba smb /etc/samba/smb.conf
mksuecalias releaseupgrades ru /etc/update-manager/release-upgrades
mksuecalias refind rfd /boot/efi/efi/refind/refind.conf

# }}}

# Automatic aliases: exit aliases {{{

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

# Automatic aliases: `quit' misspellings {{{

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

# }}}

# Automatic aliases: cd aliases {{{

mkcdalias cddl ~/Downloads
mkcdalias cddoc ~/Documents
mkcdalias cdmus ~/Music
mkcdalias cdpic ~/Pictures
mkcdalias cdvid ~/Videos
mkcdalias cdhdl ~/configs/HourlySyncLogs
mkcdalias cdbm ~/Bookmarks
mkcdalias cdand '~/Bookmarks/Android\ partition'
mkcdalias cdanime ~/Bookmarks/Anime
mkcdalias cdcart ~/Bookmarks/Cartoons
mkcdalias cddlimg '~/Bookmarks/Downloaded\ images'
mkcdalias cddlgames '~/Bookmarks/Game\ downloads'
mkcdalias cddlg '~/Bookmarks/Game\ downloads'
mkcdalias cdemugames '~/Bookmarks/Games\ \(emulator\)'
mkcdalias cdiso ~/Bookmarks/ISOs
mkcdalias cddev ~/Bookmarks/Programming
mkcdalias cdshot ~/Bookmarks/Screenshots
mkcdalias cdws ~/Bookmarks/Website
mkcdalias cdweb ~/Bookmarks/Website
mkcdalias cdwin '~/Bookmarks/Windows\ partition'
mkcdalias cdwine ~/Bookmarks/Wine
mkcdalias cdwine64 '~/Bookmarks/Wine\ \(64-bit\)'
mkcdalias cdwinep '~/Bookmarks/Wine\ prefixes'
mkcdalias cdbook ~/Bookmarks/Books
mkcdalias cdwp ~/Pictures/wallpaper
mkcdalias cdcam ~/Pictures/camera
mkcdalias cdcfg ~/configs
mkcdalias cdcfgs ~/configs
mkcdalias cdcfgbin ~/configs/bin
mkcdalias cdcfgsbin ~/configs/bin
mkcdalias cdsysd /etc/systemd/
mkcdalias cdsysdsys /etc/systemd/system
mkcdalias cd.. ..
mkcdalias .. ..
mkcdalias .... ../..
mkcdalias ...... ../../../
mkcdalias ........ ../../../..

# }}}

# Automatic aliases: --color=auto aliases {{{

mkcolorado ls
mkcolorado dir
mkcolorado vdir
mkcolorado grep
mkcolorado fgrep
mkcolorado egrep

# }}}

# WSL aliases {{{

if [ -f ~/imrunningonwsl ]; then
    alias mount-ubuntu='wsl.exe -d Ubuntu -u root mount --bind / /mnt/wsl/ubuntu' # Mount Ubuntu files
fi

# }}}

# Trolling!! HAHA LOL LMAO KEK XD UwU {{{

rm-roll() {
    alias rm='rm -iv'
    ((RANDOM % 100 < 40)) && {
        alias rm='echo -e "The rm command has been disabled for this session.\n* Hint! Run rm-roll to hopefully enable it." && true'
    }
    true
}

rm-roll

# }}}
