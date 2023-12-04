#!/bin/bash

./sync.sh
echo "Sync done."

if [[ `git status --porcelain` ]]; then
    echo "Changes found, committing"

    git add .
    git commit -m 'Sync'
    if [[ "$1" != "--nopush" ]]; then
        git push || echo "Push failed. Please run 'git push' later manually."
    fi
else
    echo "No changes, exiting"
fi
