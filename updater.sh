#!/usr/bin/env bash

# Configs Updater
# Checks if there are any updates, and if there are, prompts the user to update.
# This is more or less a generic Git repo updater so I might release it
# as a repo or a Gist.

# TODO proper plural update in functions

set -e

cd $HOME/configs

echo "Running configs updater v1.1"

fetch_error() {
    echo "Failed to fetch remote. Update canceled."
    exit 1
}

pull_error() {
    echo "Failed to pull updates. Update canceled."
    exit 2
}

do_update() {
    echo "Downloading update..."
    git pull || pull_error
    echo "Update downloaded."
}

cancel_update() {
    echo "Update canceled."
    exit 0
}

install_update() {
    echo "Instaling update..."
    ./install.sh
    echo "Update installed."
    exit 0
}

cancel_install() {
    echo "Installation canceled. Run updcfgs in your terminal to install update manually."
}

git fetch >/dev/null || fetch_error

branch_rn="$(git branch --show-current)"
new_commits="$(git log ${branch_rn}..origin/${branch_rn} --oneline)"

if [ -z "$new_commits" ]; then
    echo "Already up-to-date."
    exit 0
fi

num_new_commits="$(echo "$new_commits" | wc -l)"
updates_plural="s"
if [ "$num_new_commits" == "1" ]; then
    updates_plural=""
fi

echo "$num_new_commits update$updates_plural available:"
echo "$new_commits"

while true; do
    read -p "Download update$updates_plural? (y/n) " yn
    case $yn in
        [Yy]* ) do_update; break;;
        [Nn]* ) cancel_update;;
        * ) echo "That's not an option!";;
    esac
done

while true; do
    read -p "Install update$updates_plural? (y/n) " yn
    case $yn in
        [Yy]* ) install_update;;
        [Nn]* ) cancel_install;;
        * ) echo "That's not an option!";;
    esac
done
