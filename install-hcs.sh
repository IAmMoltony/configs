#!/usr/bin/env bash

echo "0 * * * * DISPLAY=:0.0 $HOME/configs/cronsync.sh" | crontab -
echo "done"
