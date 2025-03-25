#!/usr/bin/env bash

if [ -f ~/imrunningonwsl ]; then
    alias mount-ubuntu='wsl.exe -d Ubuntu -u root mount --bind / /mnt/wsl/ubuntu' # Mount Ubuntu files
fi
