#!/usr/bin/env bash

notify-send "Running hourly config sync."
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
        notify-send "Sync is disabled, halting"
        exit
    else
        notify-send "FORCING SYNC"
    fi
fi

mkdir -p HourlySyncLogs
hslnm=HourlySyncLogs/hsl_$(date "+%F_%T")
./sync-commit.sh "Automatic hourly sync: $(date "+%F %T")" > "$hslnm" 2>&1

notify-send "Sync done, log:"
notify-send "$(cat "$hslnm")"

if ! grep -q "No changes, exiting" "$hslnm"; then
    notify-send "Changes found, sending email"
    sendemailoutput=$(./sendemail.py $hslnm 2>&1)
    sendemailcode="$?"
    mkdir -p EmailLogs
    echo "$sendemailoutput" > EmailLogs/el_"$(date +"%F_%T")"
    if [ "$sendemailcode" != "0" ]; then
        notify-send "Sendemail FAILED, see log pls"
    fi
fi
