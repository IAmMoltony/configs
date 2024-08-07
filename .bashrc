# vim:foldmethod=marker
# shellcheck shell=bash
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

initmsg() {
    echo -ne "\033[0;36m$1 "
}

# Basic init {{{

initmsg "sh"

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

# Environment {{{

initmsg "env"

export EDITOR=/bin/vim
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/configs/bin:/usr/local/go/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT="true" # don't want no microsoft spying on me
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# }}}

# Aliases and functions {{{

initmsg "fun" # kotlin moment

if [ -f ~/.bash-configs/.bash_functions ]; then
    . ~/.bash-configs/.bash_functions
fi

initmsg "alias"

if [ -f ~/.bash-configs/.bash_aliases ]; then
    . ~/.bash-configs/.bash_aliases
fi

# BA and BF have their own error handler, this changes it
# to the BashRC one
trap 'brcerrorhdlr $LINENO' ERR

# }}}

# Programmable completion {{{

initmsg "comp"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# ^^^^ not guaranteed as this brc is meant to be portable across distros
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
    initmsg "wsl"
    WslDisplay=$(grep nameserver /etc/resolv.conf | awk '{print $2}')
    export DISPLAY="${WslDisplay}:0.0"
}

# }}}

# Prompt customization {{{

initmsg "ps1"

# prompt customizatoin
PROMPT_DIRTRIM=3
PS1='$(ps1cs)\[\e[0;34m\]\@\[\e[0m\] $(git rev-parse --is-inside-work-tree > /dev/null 2>&1 && ps1gitinfo )\[\e[0;35m\]\u\[\e[0m\]@\[\e[0;35m\]\h \[\e[1;32m\]\w \[\e[0m\]$(randomcurrency) '
PS2="ok and? "

# }}}

# Custom path {{{

if [ -f ~/.custompath ]; then
    initmsg "cp"
    . ~/.custompath
    export PATH="$PATH:$CUSTOMPATH"
fi

# }}}

export HTDOCS=/opt/lampp/htdocs

# devkitPro {{{

initmsg "dkp"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=${DEVKITPRO}/devkitARM
export DEVKITPPC=${DEVKITPRO}/devkitPPC

# }}}

# Intel compiler {{{

if [ -f "$HOME/intel/oneapi/setvars.sh" ]; then
    initmsg "intel"
    source "$HOME"/intel/oneapi/setvars.sh
fi

# }}}

# pfetch configuration {{{

initmsg "pfetch"

# do some pfetch configurationing
export PF_INFO="ascii title os host kernel uptime pkgs memory editor wm de shell palette"

# }}}

# pnpm {{{

initmsg "pnpm"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# }}}

# Perl {{{

initmsg "perl"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# }}}

# Shell options {{{

initmsg "shopt"

shopt -s cdspell # Spell-checker for the `cd' command
shopt -s histappend # Append to history file instead of overwriting it
shopt -s checkwinsize # Check the window size (idk what this does)

# }}}

# WakaTime {{{

wakatimesh="$HOME/dev/bash-wakatime/bash-wakatime.sh"

if [ -f "$wakatimesh" ]; then
    initmsg "wt"
    source "$wakatimesh"
fi

# }}}

# Inconveniences {{{

initmsg "inc"

PROMPT_COMMAND="inconveniences; $PROMPT_COMMAND"

# }}}

# Check if python is installed {{{

initmsg "pychk"

if ! command -v python3 > /dev/null 2>&1; then
    clear
    echo "!!!! ATTENTION !!!!"
    echo "YOU DO NOT HAVE PYTHON 3 INSTALLED !!!!!!!"
    echo "INSTALL NOW OR YOU WILL REGRET IT!!!!!!!!!!!!!"
    read -p -e "press enter"
    clear
fi

# }}}

# *fetch {{{

# Run somethingfetch everytime the shell is started in the following order:
#  1. fastfetch (because it's fast) (and also cuz i have a custom config)
#  2. pfetch (because it's sleek)
#  3. neofetch (as fallback)
# TODO remove copy pasting by adding fetch programs to a list

BashrcFetchOk="1"

if command -v "fastfetch" > /dev/null 2>&1; then
    initmsg "fetch"
    echo
    ffwcfg
elif command -v "pfetch" > /dev/null 2>&1; then
    initmsg "fetch"
    echo
    pfetch
    fastfetchnag
elif command -v "neofetch" > /dev/null 2>&1; then
    initmsg "fetch"
    echo
    neofetch
    fastfetchnag
else
    BashrcFetchOk="0"
fi

# }}}

# MSSC {{{

# Run Machine-Specific Startup Commands (MSSC)
# This became necessary when I wanted to install nvm on WSL but I don't use nvm on my laptop

stty echo

if [ -f "$HOME/.mssc" ]; then
    echo -e "\n\033[0m"
    source "$HOME"/.mssc
fi

stty -echo

# }}}

# Post-init stuff {{{

bashrc-postinit "$BashrcFetchOk"

trap - ERR
trap SIGINT

# }}}

