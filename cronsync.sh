#!/usr/bin/env bash

notify-send "Syncing configs"
cd "$HOME"/configs || exit 1 # Just to be safe

FORCE_SYNC=0

# Argument parsinging
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force)
            FORCE_SYNC=1
            shift
            ;;
        *)
            shift
            ;;
    esac
done

if [[ -f ./HCS_IS_DISABLED ]]; then
    if [ "$FORCE_SYNC" == "0" ]; then
        exit
    fi
fi

./sync-commit.sh "Automatic hourly sync: $(date "+%F %T")" > "$hslnm" 2>&1
