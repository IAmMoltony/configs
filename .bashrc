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

DementiaShell=0

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

# I make my own preexec lol {{{

preexec() {
    if [ "$DementiaShell" == "0" ]; then
        return
    fi

    ((RANDOM % 100 < 10)) && {
        echo -n "Command? What command?.."
        kill -INT $$ && true
    }
}


prepreexec() {
    bashcmd="$BASH_COMMAND"
    #echo "$bashcmd"
    avoid=(
        "inconveniences"
        "builtin declare -F _ksi_prompt_command > /dev/null 2> /dev/null"
        "_ksi_prompt_command"
        "trap - ERR"
        "trap - SIGINT"
        "builtin unset KITTY_BASH_RCFILE KITTY_BASH_POSIX_ENV KITTY_BASH_ETC_LOCATION"
        "builtin unset -f _ksi_sourceable"
        "builtin export KITTY_SHELL_INTEGRATION=\"\$ksi_val\""
        "builtin unset _ksi_i ksi_val kitty_bash_inject"
        "[ \"\${BASH_VERSINFO:-0}\" -lt 4 ]"
        "[[ \"\${_ksi_prompt[sourced]}\" == \"y\" ]]"
        "builtin declare -A _ksi_prompt"
        "_ksi_prompt=([cursor]='y' [title]='y' [mark]='y' [complete]='y' [cwd]='y' [sudo]='y' [ps0]='' [ps0_suffix]='' [ps1]='' [ps1_suffix]='' [ps2]='' [hostname_prefix]='' [sourced]='y' [last_reported_cwd]='')"
        "_ksi_main"
        "builtin unset -f _ksi_main"
        "case :\$SHELLOPTS: in "
        "cd_or_nah"
    )

    if [[ " ${avoid[@]} " =~ " ${bashcmd} " ]]; then
        return
    fi
    preexec
}

trap 'prepreexec' DEBUG

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
