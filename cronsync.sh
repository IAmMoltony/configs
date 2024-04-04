#!/usr/bin/env bash

notify-send "Running hourly config sync. (This is a test)"
cd $HOME/configs # Just to be safe
mkdir -p HourlySyncLogs
./sync-commit.sh "Automatic hourly sync: $(date "+%F %T")" > HourlySyncLogs/hsl_$(data "+%F_%T")
