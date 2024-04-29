# Moltony's Bash Aliases

alias rm='rm -iv' # Remove a file (verbose + confirm)
alias cp='cp -v' # Copy a file (verbose)
alias mv='mv -v' # Move a file (verbose)
alias mkdir='mkdir -v' # Create a directory (verbose)
alias rmdir='rmdir -v' # Remove a directory (verbose)
alias md='mkdir' # DOS-inspired shortcut for mkdir
alias rd='rmdir' # DOS-inspired shortcut for rmdir
alias cls='echo "Tip: press C-l to clear."' # C-l
alias edit-bashrc='$EDITOR ~/.bashrc' # Edit BashRC
alias reload-bashrc='source ~/.bashrc' # Reload BashRC
alias view-bashrc='cat ~/.bashrc | less' # View the BashRC with pager
alias cat-bashrc='view-bashrc' # Alt. spelling of view-bashrc
alias edit-bashaliases='$EDITOR ~/.bash-configs/.bash_aliases' # Edit Bash aliases
alias view-bashaliases='cat ~/.bash-configs/.bash_aliases | less' # View bash aliases with pager
alias cat-bashaliases='view-bashaliases' # Alt. spelling of view-bashrc
alias edit-custompath='$EDITOR ~/.custompath' # Edit custom PATH
alias view-custompath='cat ~/.custompath | less' # View custom PATH with pager
alias cat-custompath='view-custompath' # Alt. spelling of view-custompath
alias edit-bashfuncs='$EDITOR ~/.bash-configs/.bash_functions' # Edit bash functions
alias view-bashfuncs='cat ~/.bash-configs/.bash_functions | less' # View bash fuctions with pager
alias cat-bashfuncs='view-bashfuncs' # Alt. spelling of view-bashfuncs
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
alias relbrc='reload-bashrc' # Short reload-edit-view aliases...
alias edtbrc='edit-bashrc'
alias catbrc='view-bashrc'
alias edtba='edit-bashaliases'
alias catba='cat-bashaliases'
alias edtbf='edit-bashfuncs'
alias catbf='cat-bashfuncs'
alias edtcpath='edit-custompath'
alias catcpath='cat-custompath' # ...end of short reload-edit-view aliases
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
alias quit='exit' # Quit (exit)
alias h='history' # h(istory)
alias edit-vimrc='$EDITOR ~/.vimrc' # vimrc edit
alias view-vimrc='catless ~/.vimrc' # vimrc view
alias cat-vimrc='view-vimrc' # alt spelling vimrc view
alias edtvrc='edit-vimrc' # short vimrc edit
alias catvrc='cat-vimrc' # short vimrc view
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
alias cddl='cd ~/Downloads' # cd to downloads (I go there real often)
alias plsh='pullsh' # Pullsh but shorter
alias spsy='echo "no that would be stupid"' # This originally was an alias for `sudo pacman -Sy` but i heard that's bad
alias dnbld='dotnet build -v n' # Build a .NET solution with normal verbosity
alias dnrun='dotnet run -v n' # Run a .NET solution with normal verbosity
alias htop='btop' # btop is objectovely better
alias srbrc='syncrbrc' # Wait this exists??? omg i forgor tbh
alias scfgs='synccfgs' # Sync configs but the short version for literally no reason
alias sl='exit' # we do a bit of trolling
alias math='bc -l' # Bring up a calculator
alias catbanl='catba | cat' # View aliases without pager
alias weather='curl wttr.in/Shymkent' # View weather (for Shymkent)
alias l.='ls -d .* --color=auto' # List only hidden files
alias ..='cd ..' # Go to parent dir
alias ....='cd ../..' # Go to parent's parent dir
alias ......='cd ../../..' # Go to parent's parent's parent dir
alias ........='cd ../../../..' # Go to parent's parent's parent's parent dir
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
alias paipai='exit' # Pai pai
alias bye='exit' # Bye
alias byebye='exit' # Bye bey
alias baibai='exit' # bai bai
alias :q='exit' # VIM USER DETECTED!!!!!!!!!!!!!!!!!! SEEK SHELTER IMMEDIATELY!!!!!!!!!!!!!!!!!!
alias gaming='cd ~/Games' # Go to folder with GAMING
alias gaming-b='builtin cd ~/Games' # gaming (builtin cd edition)
alias edtcrc='$EDITOR ~/.conkyrc' # Edit Conky config file (Idk what rc stands for)
alias syncpaipai='synccfgs && paipai' # Sync configs and say pai pai
alias spaipai='syncpaipai' # Today's installment of Useless Aliases... Short version of `syncpaipai' !!!
alias gtfo='exit' # Get the f out
alias cddoc='cd ~/Documents' # Go to documents
alias cdmus='cd ~/Music' # go to music
alias scfgsm='synccfgsm' # Short versoin alias thing ojgjo2joejfjojii243jrjoo2 2323oin23roin23r
alias syncmrbrc='synccfgsm && relbrc' # Sync configs with message and rbrc
alias syncmpaipai='synccfgsm && paipai' # Sync configs with message and paipai
alias saiy='sudo apt install -y' # Install p
alias sary='sudo apt remove -y' # Rm p
alias saud='sudo apt update' # Upd ps
alias saug='sudo apt upgrade' # Upg ps
alias lsdl='ls ~/Downloads' # List ownload
alias pshcfgspaipai='pshcfgs && paipai' # Push cfgs and paipia
alias cdpic='cd ~/Pictures' # Go to pictures
alias gbch='git branch' # Git branch
alias gslog='git shortlog' # Git short log
alias :e='vim' # Another vim user HOW MANY VIM USERS DO WE HAVE
alias pshpaipai='git push && paipai' # Git push and papiap
alias wine64='WINEPREFIX=~/.wine64 wine64' # Convenience: start Wine with the 64-bit prefix
alias piapia='paipai' # Pai pai when in rush
alias dlmuspaipai='dlmus && paipai' # Download music aand then pai pai
alias gshwnp='git --no-pager show' # Git show with no pager
alias gaming-th='gaming-b && cd ./TouhouShared/drive_c' # touhou
alias gdffnp='git --no-pager diff' # git diff ith no pager
alias gundolc='git reset --soft HEAD^' # This is when i screw up
alias gundolchard='git reset --hard HEAD^' # This is when i really screw up
alias thprefix='export WINEPREFIX=/home/moltony/Games/TouhouShared'
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
alias cdhsl='cd ~/configs/HourlySyncLogs' # cd into hourly sync logs
alias catlessbf='catbf | less' # catbf with pager
alias gint='git init' # initialzie git repository
alias vimpi='vim +PlugInstall' # Install vim plugins
alias vimpu='vim +PlugUpdate' # Update vim plugins
alias rn-roll='exit' # Misspell and regret
alias :G='git' # Git
alias vimpc='vim +PlugClean' # Clean vim plugins
alias pai='gtfo' # istg
alias dirfsp='ncdu' # "dirfsp" means "directory free space". this was originally a call to du -h <some options> | sort -h
alias cdbm='cd ~/Bookmarks' # cd into bookmarks
alias cdanime='cd ~/Bookmarks/Anime' # cd into anime
alias cdcart='cd ~/Bookmarks/Cartoons' # cd into cartoons
alias cddlimg='cd ~/Bookmarks/Downloaded\ images' # cd into downloaded images
alias cddlgames='cd ~/Bookmarks/Game\ downloads' # cd into game downloads
alias cdemugames='cd ~/Bookmarks/Games\ \(emulator\)' # cd into emulator games
alias cdiso='cd ~/Bookmarks/ISOs' # cd into isos
alias cddev='cd ~/Bookmarks/Programming' # cd into dev stuff
alias cdshot='cd ~/Bookmarks/Screenshots' # cd into screenshots
alias cdws='cd ~/Bookmarks/Website' # cd into my website (https://iammoltony.github.io)
alias cdwin='cd ~/Bookmarks/Windows\ partition' # cd into my windows partition
alias cdwine='cd ~/Bookmarks/Wine' # cd into default wine prefix
alias cdwinep='cd ~/Bookmarks/Wine\ prefixes' # cd into wine prefixes folder (~/.local/share/wineprefixes)
alias cdbook='cd ~/Bookmarks/Books' # cd into booksl
alias grn='grep -Irn' # Shortcut for grep -rn
alias grn2do='grn . -e TODO' # Find TODOs *ds-craft flashbacks*
alias rmhsl='rm ~/configs/HourlySyncLogs -rf' # Remove hourly config sync logs
alias edtcs='$EDITOR ~/configs/cronsync.sh' # Edit cron sync script
alias eedtba='exit' # Typo and regret
alias cdcfg='cd ~/configs' # cd into configs
alias rmun='find . -name "*.un~" -exec rm -f {} +' # Remove annoying Vim backup files
alias gpshpaipai='gpsh && paipai' # Git push pai pai
alias catsrcl='cat /etc/apt/sources.list | less' # View the sources.list file
alias edtsrcl='sudo vim /etc/apt/sources.list' # Edit sources.list
alias gagcm='git add . && git commit -m' # Git add and commit
alias rf='rm -rf' # h
alias cddlg='cddlgames' # just
alias gshh='git show HEAD' # Show head
alias gshhnp='git --no-pager show HEAD' # Show head without pager
alias dnclean='dotnet clean -v n' # dotnet clean
alias wine64tricks='WINEPREFIX=~/.wine64 winetricks' # Winetricks in 64-bit prefix
alias rm-rol='exit' # I love to mess with myself
alias cdwine64='cd ~/Bookmarks/Wine (64-bit)' # cd into default 64-bit wine prefix
alias thu='thunar' # Shorthand for thunar
alias thubkmk='thu ~/Bookmarks &' # Start Thunar in the bookmarks folder
alias cdwp='builtin cd ~/Pictures/wallpaper' # Go to wallpapers folder (Using builtin cd here because i have tons of wallpapers on my laptop)
alias updplaylist='audacious & audtool --playlist-clear && audtool --playlist-addurl /home/moltony/Music' # Update playlist in Audacious
alias edtmssc='$EDITOR ~/.mssc' # Edit MSSC
alias grgpll='gr. && gpll' # Remove all local changes and pull
alias edtdr='$EDITOR ~/Documents/DiaReplacement.txt' # Edit DiaReplacement, the file where I store my diary entries when I lose my diary
alias edtsmb='sudo $EDITOR /etc/samba/smb.conf' # Edit Samba configuartion file
alias gcaaem='git commit -a --allow-empty-message' # Commit with empty message
alias cdcfgs='cdcfg' # Alt spelling of cdcfg
alias restoreresolution='xrandr -s 1366x768' # Restore screen resolution
alias glf='git ls-files' # List git files
alias exir='exit' # misspell and not regret cuz you wanted to exit in a rush
alias pia='piapia' # Piapia but lazy
alias edtcp='edtcpath' # Edit custom path
alias care='love .' # Start love2d
alias dlmus='~/Music/music-lib/download' # Download music
alias redlmus='~/Music/music-lib/redownload' # Re-download music
alias rmmus='~/Music/music-lib/delete.py' # Delete music
alias edtprf='$EDITOR ~/.profile' # Edit profile
alias edtsl='$EDITOR /etc/apt/sources.list' # Edit apt sources.list file
alias qsqsqs='exit' # laZY
alias edtfs='sudo $EDITOR /etc/fstab' # Edit fstab
alias sma='sudo mount -a' # Short sudo mount -a
alias edtru='sudo $EDITOR /etc/update-manager/release-upgrades' # Edit release upgrades file
alias numalias='alias | wc -l' # Count how many aliases are installed
alias catfs='cat /etc/fstab' # Cat ftstb
alias qiut='exit' # qiut
alias edtkc='$EDITOR $HOME/.config/kitty/kitty.conf' # Edit kitty config
alias kittyfonts='kitty +list-fonts' # list fonts supported by kityy
alias cdweb='cdws' # I messed this one up so many times I had to make an alias
alias qtui='exit' # qtui
alias quti='exit' # quti
alias qtiu='exit' # qtiu
alias tqui='exit' # tqui
alias uiqt='exit' # uiqt
alias uqti='exit' # uqti
alias qitu='exit' # qitu
alias utqi='exit' # utqi
alias itqu='exit' # itqu

# TODO make a system that would automatically create:
#  - cd aliases
#  - edit aliases
#  - cat aliases
#  - quit aliases

# Trolling!! HAHA LOL LMAO KEK XD UwU
rm-roll() {
    alias rm='rm -iv'
    ((RANDOM % 100 < 50)) && {
        alias rm='echo -e "The rm command has been disabled for this session.\n* Hint! Run rm-roll to hopefully enable it." && true'
    }
}

rm-roll
