#!/bin/bash

./sync.sh
echo "Sync done."

if [[ $(git status --porcelain) ]]; then
    echo "Changes found, committing"

    git add .
    if [ "$1" != "" ]; then
        git commit -m 'Sync'
    else
        git commit -m "Sync: $1"
    fi
    git push || echo "Push failed. Please run 'git push' later manually."
else
    echo "No changes, exiting"
fi
