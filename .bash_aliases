# Verbose remove
alias rm='rm -v'

# Verbose copy
alias cp='cp -v'

# Verbose move
alias mv='mv -v'

# Verbose make directory
alias mkdir='mkdir -v'

# Verbose remove directory
alias rmdir='rmdir -v'

# Short mkdir
alias md='mkdir'

# Short rmdir
alias rd='rmdir'

# Short clear
alias cls='clear'

# Edit bashrc using the preferred editor
alias edit-bashrc='$EDITOR ~/.bashrc'

# Reload bashrc
alias reload-bashrc='source ~/.bashrc'

# View bashrc
alias view-bashrc='cat ~/.bashrc | less'

# View bashrc (alt. spelling)
alias cat-bashrc='view-bashrc'

# Edit bash aliases using the preferred editor
alias edit-bashaliases='$EDITOR ~/.bash-configs/.bash_aliases'

# View bash aliases
alias view-bashaliases='cat ~/.bash-configs/.bash_aliases | less'

# View bash aliases (alt.spelling)
alias cat-bashaliases='view-bashaliases'

# Edit custom path using the preferred editor
alias edit-custompath='$EDITOR ~/.custompath'

# View custom path
alias view-custompath='cat ~/.custompath | less'

# View custom path (alt. spelling)
alias cat-custompath='view-custompath'

# Edit bash functions using the preferred editor
alias edit-bashfuncs='$EDITOR ~/.bash-configs/.bash_functions'

# View bash functions
alias view-bashfuncs='cat ~/.bash-configs/.bash_functions | less'

# View bash functions (alt. spelling)
alias cat-bashfuncs='view-bashfuncs'

# Pull & push at the same time
alias pullsh='git pull && git push'

# ls variation
alias lt='ls -lh --size -1 -S --classify'

# Show only mounted drives
alias mnt="mount | awk -F ' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

# Grep the command history
alias grephist='history | grep'

# ls variations
alias lq='ls -tl -1'
alias lqa='la -tl -1'

# Count files in current dir
alias cntfiles='find . -type f | wc -l'

# Copy with progress bar
alias cppb='rsync -ah --info=progress2'

# Go to the root of Git repo
alias cdgr='cd `git rev-parse --show-toplevel`'

# git log shortcut
alias glog='git log'

# git log all shortcut
alias gloga='git log --all'

# glog shortcut
alias glg='glog'

# gloga shortcut
alias glga='gloga'

# Show today's commits
alias todayscommits='glog --oneline --since=midnight'

# Total number of commits
alias numcommits='glog --oneline | wc -l'

# Numberr of commits today
alias numcommtoday='todayscommits | wc -l'

# Reload bashrc (short)
alias relbrc='reload-bashrc'

# Edit bashrc (short)
alias edtbrc='edit-bashrc'

# View bashrc (short)
alias catbrc='view-bashrc'

# Edit bash aliases (short)
alias edtba='edit-bashaliases'

# View bash aliases (short)
alias catba='cat-bashaliases'

# Edit bash functions (short)
alias edtbf='edit-bashfuncs'

# View bash functions (short)
alias catbf='cat-bashfuncs'

# Edit custom path (short)
alias edtcpath='edit-custompath'

# View custom path (short)
alias catcpath='cat-custompath'

# pacman: sync, update package lists, update all packages, no confirm
alias spsyu='sudo pacman -Syu --noconfirm --needed'

# pacman: sync, no confirm
alias spsnc='sudo pacman -S --noconfirm --needed'

# pacman: remove no confirm
alias sprnc='sudo pacman -R --noconfirm'

# pacman: search
alias spss='sudo pacman -Ss'

# Hexdump alias
alias hd='hexdump -C'

# Make an AUR package
alias mkaur='makepkg -si --noconfirm'

# git commit -am shortcut
alias gcam='git commit -am'

# git push shortcut
alias gpsh='git push'

# git pull shortcut
alias gpll='git pull'

# git status shortcut
alias gst='git status'

# git fetch shortcut
alias gftch='git fetch'

# git clone shortcut
alias gcln='git clone'

# git config shortcut
alias gcfgg='git config --global'

# git config user name shortcut
alias gcfgun='gcfgg user.name'

# git config user email shortcut
alias gcfgue='gcfgg user.email'

# git diff shortcut
alias gdff='git diff'

# git show shortcut
alias gshw='git show'

# git log one line shortcut
alias glogol='glog --oneline'

# git restore shortcut
alias gr.='git restore .'

# gnu make
alias mk='make'

# git add dot
alias ga.='git add .'

# git add
alias gdd='git add'

# git commit shortcut
alias gcm='git commit -m'

# reboot
alias reboot='sudo reboot'

# how many free space
alias freespc='df -h /dev/sda2'

# pacman: clear cache
alias spsc='sudo pacman -Sc --noconfirm'

# Short doxygen
alias doxy='doxygen'

# Exit but quit
alias quit='exit'

# h
alias h='history'

# edit vimrc
alias edit-vimrc='$EDITOR ~/.vimrc'

# view vimrc
alias view-vimrc='catless ~/.vimrc'

# cat vimrc
alias cat-vimrc='view-vimrc'

# edit vimrc shorter
alias edtvrc='edit-vimrc'

# view vimrc shorter
alias catvrc='cat-vimrc'

# shutdown
alias shutdown='sudo shutdown'

# sync and reload bashrc
alias syncrbrc='synccfgs && relbrc'
