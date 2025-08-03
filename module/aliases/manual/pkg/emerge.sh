#!/usr/bin/env bash

alias sem='sudo emerge' # emerges casually
alias sema='sudo emerge --ask' # emerges; asks
alias semacudw='sudo emerge --ask --changed-use --deep @world' # emerges; asks; changes USE; digs deep in the @world
alias sesnr='sudo eselect news read' # read the daily newspaper
alias sesasemacudw='sudo emaint sync -a && semacudw' # tl;dr update system
