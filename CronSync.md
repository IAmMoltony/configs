# Cron Sync

*TODO rewrite this thing*

`cronsync.sh` is a script for automatically syncing configs and creating a sync log
in `HourlySyncLogs/`. It's designed to be run every hour via cron.

## Setting up Cron Sync

1. `crontab -e`
1. put this: `0 * * * * DISPLAY=:0.0 /home/ur_username/configs/cronsync.sh`
1. save
1. go into `~/configs`
1. `pip install -r sendemail-requirements.txt`
1. done
