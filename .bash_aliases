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
alias freespc='df -h /' # Check free space in the root filesystem
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
alias dirfsp='du --max-depth=1 -h | sort -h' # Analyze free space in directory
alias plsh='pullsh' # Pullsh but shorter
alias spsy='echo "no that would be stupid"' # This originally was an alias for `sudo pacman -Sy` but i heard that's bad
alias dnbld='dotnet build -v d' # Build a .NET solution with detailed verbosity
alias dnrun='dotnet run -v d' # Run a .NET solution with detailed verbosity
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
alias :e='vim' # Another vim user
alias pshpaipai='git push && paipai' # Git push and papiap
alias freespcw='df -h /windows' # Check free space on windows partition
alias wine64='WINEPREFIX=~/.wine64 wine64'

# Replace sudo with doas for literally no reason whatsoever
if command -v "doas" > /dev/null 2>&1; then
    [ -f "/etc/doas.conf" ] && alias sudo='doas'
    [ ! -f "/etc/doas.conf" ] && echo "W: \`doas' installed, but \`/etc/doas.conf' not found. Regular \`sudo' will be used."
fi

# Trolling!! HAHA LOL LMAO KEK XD UwU
rm-roll() {
    ((RANDOM % 100 < 50)) && {
        alias rm='echo "The rm command has been disabled for this session.\n* Hint! Run rm-roll to hopefully enable it." && true'
    }
}

rm-roll
