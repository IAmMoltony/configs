#!/usr/bin/env bash

# Configs Updater
# Checks if there are any updates, and if there are, prompts the user to update.
# This is more or less a generic Git repo updater so I might release it
# as a repo or a Gist.

set -e

cd $HOME/configs

echo "Running configs updater v1.0.1"

fetch_error() {
    echo "Failed to fetch remote. Update canceled."
    exit 1
}

pull_error() {
    echo "Failed to pull updated. Update canceled."
    exit 2
}

do_update() {
    echo "Updating..."
    git pull || pull_error
    echo "Update done. Run \`rbrc' to apply update."
    exit 0
}

cancel_update() {
    echo "Update canceled."
    exit 0
}

git fetch >/dev/null || fetch_error

branch_rn="$(git branch --show-current)"
new_commits="$(git log ${branch_rn}..origin/${branch_rn} --oneline)"

if [ -z "$new_commits" ]; then
    echo "Already up-to-date."
    exit 0
fi

echo "$(echo "$new_commits" | wc -l) updates available:"
echo "$new_commits"

while true; do
    read -p "Update? (y/n) " yn
    case $yn in
        [Yy]* ) do_update;;
        [Nn]* ) cancel_update;;
        * ) echo "That's not an option!";;
    esac
done
