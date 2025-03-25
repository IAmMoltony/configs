#!/usr/bin/env bash

ubaerrorhdlr() {
    echo " ! User Alias Init error on line $1"
    ((BashAliasesNumErrors++))
}

trap 'ubaerrorhdlr $LINENO' ERR

# Migration from old user aliases location
if [ -f "$HOME/.bash-configs/.useraliases" ]; then
    \mv "$HOME/.bash-configs/.useraliases" "$HOME/.config/bash-configs/useraliases"
fi

if [ -f "$HOME/.config/bash-configs/useraliases" ]; then
    source "$HOME/.config/bash-configs/useraliases"
fi
