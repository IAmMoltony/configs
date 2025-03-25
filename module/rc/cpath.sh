#!/usr/bin/env bash

if [ -f ~/.custompath ]; then
    # TODO function for reloading custom path at will
    . ~/.custompath
    export PATH="$PATH:$CUSTOMPATH"
fi
