
# Cron Sync

`cronsync.sh` is a script for automatically syncing configs and creating a sync log
in `HourlySyncLogs/`. It's designed to be run every hour via cron.

## Setting up Cron Sync

1. `crontab -e`
2. put this: `0 * * * * DISPLAY=:0.0 /home/ur_username/configs/cronsync.sh`
3. save
5. go into `~/configs`
42. `pip install -r sendemail-requirements.txt`
69. done
