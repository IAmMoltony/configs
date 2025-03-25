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

# This crap doesn't work in the module system for some reason so it's here {{{

BashrcNumErrors=0

# Error handling {{{

brcerrorhdlr() {
    echo " ! ERROR occured in shell init. Stack trace:"
    local i=0
    while [ $i -lt ${#BASH_SOURCE[@]} ]; do
        echo "    ${BASH_SOURCE[$i]}:${BASH_LINENO[$i]} in func ${FUNCNAME[$i]}"
        ((i++))
    done
    ((BashrcNumErrors++))
}

trap 'brcerrorhdlr $LINENO' ERR

# }}}

# Ctrl-C prevention {{{

trap 'echo "Nuh-uh!"' SIGINT

# }}}

# Programmable completion {{{

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

# }}}

load_module() {
    source "$HOME/configs/module/loader.sh" "$1"
}

clear

load_module rc

trap - ERR
trap - SIGINT
cd
