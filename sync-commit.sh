#!/bin/bash

./sync.sh
echo "Sync done."

if [[ `git status --porcelain` ]]; then
    echo "Changes found, committing"

    git add .
    git commit -m 'Sync'
    git push || echo "Push failed. Please run 'git push' later manually."
else
    echo "No changes, exiting"
fi
