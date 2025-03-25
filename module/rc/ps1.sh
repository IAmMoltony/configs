#!/usr/bin/env bash

# prompt customizatoin
PROMPT_DIRTRIM=3
PS1='$(ps1cs)\[\e[0;34m\]\@\[\e[0m\] $(git rev-parse --is-inside-work-tree > /dev/null 2>&1 && ps1gitinfo )\[\e[0;35m\]\u\[\e[0m\]@\[\e[0;35m\]\h \[\e[1;32m\]\w \[\e[0m\]$(randomcurrency) '
PS2="ok and? "

# ^^^
# dir trim: only last 3 folders displayed
# ps1: [uh or ok depending on whether command success] [time] [if in git repo then git stuff] [user]@[hostname] [cwd] [random currency]
