#!/usr/bin/env bash

notify-send "Running hourly config sync."
cd $HOME/configs # Just to be safe

if [[ -f ./HSL_IS_DISABLED ]]; then
    notify-send "Sync is disabled, halting"
    exit
fi

mkdir -p HourlySyncLogs
hslnm=HourlySyncLogs/hsl_$(date "+%F_%T")
./sync-commit.sh "Automatic hourly sync: $(date "+%F %T")" > $hslnm 2>&1

notify-send "Sync done, log:"
notify-send $(cat $hslnm)
