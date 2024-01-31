alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias md='mkdir'
alias rd='rmdir'
alias cls='clear'
alias edit-bashrc='$EDITOR ~/.bashrc'
alias reload-bashrc='source ~/.bashrc'
alias view-bashrc='cat ~/.bashrc | less'
alias cat-bashrc='view-bashrc'
alias edit-bashaliases='$EDITOR ~/.bash-configs/.bash_aliases'
alias view-bashaliases='cat ~/.bash-configs/.bash_aliases | less'
alias cat-bashaliases='view-bashaliases'
alias edit-custompath='$EDITOR ~/.custompath'
alias view-custompath='cat ~/.custompath | less'
alias cat-custompath='view-custompath'
alias edit-bashfuncs='$EDITOR ~/.bash-configs/.bash_functions'
alias view-bashfuncs='cat ~/.bash-configs/.bash_functions | less'
alias cat-bashfuncs='view-bashfuncs'
alias pullsh='git pull && git push'
alias lt='ls -lh --size -1 -S --classify'
alias mnt="mount | awk -F ' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias grephist='history | grep'
alias lq='ls -tl -1'
alias lqa='la -tl -1'
alias cntfiles='find . -type f | wc -l'
alias cppb='rsync -ah --info=progress2'
alias cdgr='cd `git rev-parse --show-toplevel`'
alias glog='git log'
alias gloga='git log --all'
alias glg='glog'
alias glga='gloga'
alias todayscommits='glog --oneline --since=midnight'
alias numcommits='glog --oneline | wc -l'
alias numcommtoday='todayscommits | wc -l'
alias relbrc='reload-bashrc'
alias edtbrc='edit-bashrc'
alias catbrc='view-bashrc'
alias edtba='edit-bashaliases'
alias catba='cat-bashaliases'
alias edtbf='edit-bashfuncs'
alias catbf='cat-bashfuncs'
alias edtcpath='edit-custompath'
alias catcpath='cat-custompath'
alias spsyu='sudo pacman -Syu --noconfirm --needed'
alias spsnc='sudo pacman -S --noconfirm --needed'
alias sprnc='sudo pacman -R --noconfirm'
alias spss='sudo pacman -Ss'
alias sprnsnc='sudo pacman -Rns --noconfirm'
alias hd='hexdump -C'
alias mkaur='makepkg -si --noconfirm'
alias gcam='git commit -am'
alias gpsh='git push'
alias gpll='git pull'
alias gst='git status'
alias gftch='git fetch'
alias gcln='git clone'
alias gcfgg='git config --global'
alias gcfgun='gcfgg user.name'
alias gcfgue='gcfgg user.email'
alias gdff='git diff'
alias gshw='git show'
alias glogol='glog --oneline'
alias glgol='glogol'
alias gr.='git restore .'
alias grs='git restore'
alias mk='make'
alias ga.='git add .'
alias gdd='git add'
alias gcm='git commit -m'
alias reboot='sudo reboot'
alias freespc='df -h /dev/sda2'
alias spsc='sudo pacman -Sc --noconfirm'
alias doxy='doxygen'
alias quit='exit'
alias h='history'
alias edit-vimrc='$EDITOR ~/.vimrc'
alias view-vimrc='catless ~/.vimrc'
alias cat-vimrc='view-vimrc'
alias edtvrc='edit-vimrc'
alias catvrc='cat-vimrc'
alias shutdown='sudo shutdown'
alias syncrbrc='synccfgs && relbrc'
alias edit-custompath='$EDITOR ~/.custompath'
alias view-custompath='catless ~/.custompath'
alias cat-custompath='view-custompath'
alias edtcp='edit-custompath'
alias catcp='cat-custompath'
alias devcd='cd ~/dev && cd'
alias gcobj='git count-objects'
alias spsu='sudo pacman -Su --noconfirm'
alias glgolrv='glogol --reverse'
