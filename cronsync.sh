#!/usr/bin/env bash

notify-send "Running hourly config sync."
cd $HOME/configs # Just to be safe
mkdir -p HourlySyncLogs
./sync-commit.sh "Automatic hourly sync: $(date "+%F %T")" > HourlySyncLogs/hsl_$(date "+%F_%T")

echo "dbg: Exit code = $?"

if [ "$?" == "0" ]; then
    notify-send "HCS: all good"
fi
if [ "$?" == "1" ]; then
    notify-send "HCS: can't push"
fi
if [ "$?" == "2" ]; then
    notify-send "HCS: no changes"
fi
