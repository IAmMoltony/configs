#!/usr/bin/env bash

# Run somethingfetch everytime the shell is started
BashrcFetchOk="1"
echo # absolutely required
"$HOME"/configs/ultra_fetcher_9000.py || BashrcFetchOk="0"
