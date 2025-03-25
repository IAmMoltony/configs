#!/usr/bin/env bash

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh" # Cool kitty ssh alias (kitty exclusive)

# if ~/.pipbsp is there, default pip to pipbsp
if [ -f "$HOME/.pipbsp" ]; then
    alias pip='pipbsp'
fi

# if btop is installed, replace htop with btop
if command -v btop >/dev/null 2>&1; then
    alias htop='btop'
fi

# if we on wayland then clipfile always wayland
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    alias clipfile='clipfile-wl'
fi
