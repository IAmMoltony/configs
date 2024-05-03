#!/bin/bash

# Return 0 on successful push
#        1 on successful commit, but no successful push
#        2 on no changes

./sync.sh
echo "Sync done."

if [[ $(git status --porcelain) ]]; then
    echo "Changes found, committing"

    git add .
    if [ "$1" == "" ]; then
        git commit -m 'Sync'
    else
        git commit -m "Sync: $1"
    fi
    git push || {
        echo "Push failed. Please run 'git push' later manually."
        exit 1
    }
    exit 0
else
    echo "No changes, exiting" # dont change this line or else cron sync will break
    exit 2
fi
