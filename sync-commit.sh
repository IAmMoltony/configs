#!/bin/bash

./sync.sh
echo "Sync done."

if [[ `git status --porcelain` ]]; then
    echo "Changes found, committing"

    git add .
    git commit -m 'Sync' -m '`git ls-files -m`'
    git push
else
    echo "No changes, exiting"
fi
