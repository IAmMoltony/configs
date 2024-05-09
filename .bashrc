# vim:foldmethod=marker
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

# Error handling {{{

brcerrorhdlr() {
    echo " ! Shell Init error on line $1"
    ((BashrcNumErrors++))
}

trap 'brcerrorhdlr $LINENO' ERR

# }}}

# Ctrl-C prevention {{{

trap 'echo "Nuh-uh!"' SIGINT

# }}}

clear

# Basic init {{{

echo "Initializing shell"

stty -echo

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# }}}

# Editor and path {{{

echo "Setting editor and path"

export EDITOR=/bin/vim
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:~/configs/bin"

# }}}

# Aliases and functions {{{

echo "Adding functions"

if [ -f ~/.bash-configs/.bash_functions ]; then
    . ~/.bash-configs/.bash_functions
fi

echo "Adding aliases"

if [ -f ~/.bash-configs/.bash_aliases ]; then
    . ~/.bash-configs/.bash_aliases
fi

# BA and BF have their own error handler, this changes it
# to the BashRC one
trap 'brcerrorhdlr $LINENO' ERR

# }}}

# Programmable completion {{{

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

# }}}

# WSL {{{

[ -f imrunningonwsl ] && {
    echo "Setting WSL display"
    export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
}

# }}}

# Prompt customization {{{

echo "Customizing prompt"

# prompt customizatoin
PS1='\[\e[0;35m\]\u \[\e[1;32m\]\w \[\e[0m\]$(randomcurrency) '
PS2="... "

# }}}

# Custom path {{{

if [ -f ~/.custompath ]; then
    echo "Setting custom path"
    . ~/.custompath
    export PATH="$PATH:$CUSTOMPATH"
fi

# }}}

export HTDOCS=/opt/lampp/htdocs

# devkitPro {{{

echo "Setting devkitPro environment"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=${DEVKITPRO}/devkitARM
export DEVKITPPC=${DEVKITPRO}/devkitPPC

# }}}

# Intel compiler {{{

if [ -f "$HOME/intel/oneapi/setvars.sh" ]; then
    echo "Initializing Intel compiler"
    source $HOME/intel/oneapi/setvars.sh
fi

# }}}

# pfetch configuration {{{

echo "Configuring pfetch"

# do some pfetch configurationing
export PF_INFO="ascii title os host kernel uptime pkgs memory editor wm de shell palette"

# }}}

# pnpm {{{

echo "Initializing pnpm"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# }}}

# Perl {{{

echo "Initializing Perl environment"

PATH="/home/moltony/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/moltony/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/moltony/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/moltony/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/moltony/perl5"; export PERL_MM_OPT;

# }}}

# Shell options {{{

echo "Enabling shell options"

shopt -s cdspell # Spell-checker for the `cd' command
shopt -s histappend # Append to history file instead of overwriting it
shopt -s checkwinsize # Check the window size (idk what this does)

# }}}

# WakaTime {{{

wakatimesh="$HOME/dev/bash-wakatime/bash-wakatime.sh"

if [ -f "$wakatimesh" ]; then
    echo "Enabling WakaTime"
    source $wakatimesh
fi

# }}}

# *fetch {{{

# Run neofetch everytime the shell is started in the following order:
#  1. fastfetch (because it's fast) (and also cuz i have a custom config)
#  2. pfetch (because it's sleek)
#  3. neofetch (as fallback)
if command -v "fastfetch" > /dev/null 2>&1; then
    echo "Running fastfetch"
    ffwcfg
elif command -v "pfetch" > /dev/null 2>&1; then
    echo "Running pfetch"
    pfetch
elif command -v "neofetch" > /dev/null 2>&1; then
    echo "Running neofetch"
    neofetch
fi

# }}}

# MSSC {{{

# Run Machine-Specific Startup Commands (MSSC)
# This became necessary when I wanted to install nvm on WSL but I don't use nvm on my laptop
if [ -f "$HOME/.mssc" ]; then
    echo "Running Machine-Specific Startup Commands"
    source $HOME/.mssc
fi

# }}}

# Inconveniences {{{

PROMPT_COMMAND="inconveniences; $PROMPT_COMMAND"

# }}}

# Post-init stuff {{{

echo -e "\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0m"

echo -e "Hi \033[0;32m$USER\033[0m!"
echo -e "It is currently \033[0;36m$(LC_ALL=C date +"%H:%M %p")\033[0m on $(adelightful) \033[0;36m$(LC_ALL=C date +"%A")\033[0m."

hcs-is-enabled --color
cleanupchecker9000

if [ -d "$HOME/configs/HourlySyncLogs" ]; then
    echo -e "Hourly sync logs take up \033[1;33m$(du -sh ~/configs/HourlySyncLogs | awk '{ print $1 }').\033[0m"
fi

checkhsl

echo -e "\033[0;36m$(alias | wc -l)\033[0m aliases and \033[0;36m$(lsfuncs | wc -l)\033[0m functions are installed."

bdaycheck
maythe4

BashrcEndTime=$(date +%s.%N)

if command -v "bc" > /dev/null 2>&1; then
    BashrcRuntime=$(echo "scale=3; ($BashrcEndTime - $BashrcStartTime) / 1" | bc -l | awk '{printf "%.3f\n", $0}')
    echo "Shell initialized in $BashrcRuntime seconds with $BashrcNumErrors errors."
else
    echo "Shell initialized with $BashrcNumErrors errors."
fi

# TODO time BA and BF
echo "Aliases initialized with $BashAliasesNumErrors errors."
echo "Functions initialized with $BashFunctionsNumErrors errors."

# If bc isn't installed then tell
if ! command -v "bc" > /dev/null 2>&1 && [ ! -f "$HOME/.idontwanttoinstallbc" ]; then
    echo -e "Shell init timing is \033[0;31munavailable\033[0m."
    echo "To enable shell init timing, please install bc on your system."
    echo "To disable this message, run disablebchint."
fi

stty echo
trap - ERR
trap SIGINT

# }}}

