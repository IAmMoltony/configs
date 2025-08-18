#!/usr/bin/env bash

export EDITOR=/bin/vim
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/configs/bin:/usr/local/go/bin:$HOME/bin:$HOME/.local/share/dotnet/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT="true" # don't want no microsoft spying on me
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export GOPATH="$XDG_DATA_HOME"/go
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export HTDOCS=/opt/lampp/htdocs

mkdir -p "$XDG_STATE_HOME"/bash

# fnm
FNM_PATH="/home/moltony/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
