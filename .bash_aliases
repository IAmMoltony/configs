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

# Show today's commits
alias todayscommits='git log --oneline --since=midnight'

# Total number of commits
alias numcommits='git log --oneline | wc -l'

# Numberr of commits today
alias numcommtoday='todayscommits | wc -l'

# Reload bashrc (short)
alias relbrc='reload-bashrc'

# Edit bashrc (short)
alias edtbrc='edit-bashrc'

# View bashrc (short)
alias catbrc='view-bashrc'

# pacman: sync, update package lists, update all packages, no confirm
alias spsyu='sudo pacman -Syu --noconfirm'

# pacman: sync, no confirm
alias spsnc='sudo pacman -S --noconfirm'
