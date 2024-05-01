# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

BashrcStartTime=$(date +%s.%N)

BashrcNumErrors=0

# BashRC error handler
brcerrorhdlr() {
    echo " ! Shell init error on line: $1"
    ((BashrcNumErrors++))
}

trap 'brcerrorhdlr $LINENO' ERR

clear

echo "Initializing shell"

stty -echo

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# (that's what she said)
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

echo "Setting editor and path"

export EDITOR=/bin/vim
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:~/configs/bin"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

echo "Adding functions"

if [ -f ~/.bash-configs/.bash_functions ]; then
    . ~/.bash-configs/.bash_functions
fi

echo "Adding aliases"

if [ -f ~/.bash-configs/.bash_aliases ]; then
    . ~/.bash-configs/.bash_aliases
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

echo "Enabling programmable completion"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f imrunningonwsl ] && {
    echo "Setting WSL display"
    export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
}

echo "Customizing prompt"

# prompt customizatoin
PS1="\[\e[0;35m\]\u \[\e[1;32m\]\w \[\e[0m\]₸ "
PS2="... "

if [ -f ~/imrunningonwsl ]; then
    echo "Adding WSL aliases"
    alias mount-ubuntu='wsl.exe -d Ubuntu -u root mount --bind / /mnt/wsl/ubuntu'
fi

if [ -f ~/.custompath ]; then
    echo "Setting custom path"
    . ~/.custompath
    export PATH="$PATH:$CUSTOMPATH"
fi

export HTDOCS=/opt/lampp/htdocs

echo "Setting devkitPro environment"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=${DEVKITPRO}/devkitARM
export DEVKITPPC=${DEVKITPRO}/devkitPPC

# set intel compiler
if [ -f "$HOME/intel/oneapi/setvars.sh" ]; then
    echo "Initializing Intel compiler"
    source $HOME/intel/oneapi/setvars.sh
fi

# ssh but cooler
[ "$TERM" = "xterm-kitty" ] && {
    echo "Setting custom ssh alias"
    alias ssh="kitty +kitten ssh"
}

echo "Configuring pfetch"

# do some pfetch configurationing
export PF_INFO="ascii title os host kernel uptime pkgs memory editor wm de shell palette"

echo "Initializing pnpm"

export PNPM_HOME="/home/moltony/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

echo "Setting MonoGame effect compiler wine path"

# Mono game shader thing
export MGFXC_WINE_PATH="$HOME/.local/share/wineprefixes/monogame"

echo "Enabling cdspell"

# CD spell
shopt -s cdspell

echo "Enabling WakaTime"

source $HOME/dev/bash-wakatime/bash-wakatime.sh

# Run neofetch everytime the shell is started in the following order:
#  1. fastfetch (because it's fast)
#  2. pfetch (because it's sleek)
#  3. neofetch (as fallback)
if command -v "fastfetch" > /dev/null 2>&1; then
    echo "Running fastfetch"
    fastfetch -c "$HOME/configs/fastfetch-cfg.jsonc"
elif command -v "pfetch" > /dev/null 2>&1; then
    echo "Running pfetch"
    pfetch
elif command -v "neofetch" > /dev/null 2>&1; then
    echo "Running neofetch"
    neofetch
fi

# Run Machine-Specific Startup Commands (MSSC)
# This became necessary when I wanted to install nvm on WSL but I don't use nvm on my laptop
if [ -f "$HOME/.mssc" ]; then
    echo "Running Machine-Specific Startup Commands"
    source $HOME/.mssc
fi

hcs-is-enabled

echo "Hourly sync logs take up $(du -sh ~/configs/HourlySyncLogs | awk '{ print $1 }')."

checkhsl

echo "$(alias | wc -l) aliases are installed."

bdaycheck

BashrcEndTime=$(date +%s.%N)

if command -v "bc" > /dev/null 2>&1; then
    BashrcRuntime=$(echo "scale=3; ($BashrcEndTime - $BashrcStartTime) / 1" | bc -l | awk '{printf "%.3f\n", $0}')
    echo "Shell initialized in $BashrcRuntime seconds with $BashrcNumErrors errors."
else
    echo "Shell initialized with $BashrcNumErrors errors."
fi

stty echo
trap - ERR
