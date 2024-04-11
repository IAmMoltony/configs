#!/usr/bin/env bash

notify-send "Running hourly config sync."
cd $HOME/configs # Just to be safe
mkdir -p HourlySyncLogs
./sync-commit.sh "Automatic hourly sync: $(date "+%F %T")" > HourlySyncLogs/hsl_$(date "+%F_%T") 2>&1

if (( $? == 0 )); then
    notify-send "Sync: OK"
elif (( $? == 1 )); then
    notify-send "Sync: Can't push changes"
elif (( $? == 2 )); then
    notify-send "Sync: No changes"
fi
