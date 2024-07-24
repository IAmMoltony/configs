# Cron Sync

`cronsync.sh` is a script for automatically syncing configs.

## Setting up Cron Sync

1. `crontab -e`

1. put this: `0 * * * * DISPLAY=:0.0 /home/ur_username/configs/cronsync.sh`

- This sets up the script to run every hour, but you can set up any schedule
you like.

1. save

1. done
