
# configs

This repo is for backing up my Linux configurations (and easily installing one of my most favoritest fonts)

## Installation

```bash
git clone https://github.com/IAmMoltony/configs ~/configs # clone the repository
cd ~/configs # go into the repo dir
./install-cascadia-code.sh # install cascadia code (OPTIONAL, don't run if you don't need the font)
./install.sh # install configurations
pip install -r sendemail-requirements.txt # install requirements for sendemail module (OPTIONAL, only if you're using HCS)
source ~/.bashrc # reload bashrc
```

### HCS

HCS (Hourly Config Sync, also referred to as Cron Sync) is a convenient system for automatically backing up configs every hour.

See `CronSync.md`.

## Warning

All configs and scripts for installing/updating/syncing assume that this repo is in your home directory, so make sure
you clone it there or symlink it.

