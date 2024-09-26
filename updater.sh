#!/usr/bin/env bash

# Configs Updater
# Checks if there are any updates, and if there are, prompts the user to update.

set -e

cd "$HOME"/configs || {
    echo "Directory $HOME/configs not found. Halting."
    exit 3
}

echo "Running configs updater v1.2.2"

fetch_error() {
    echo "Failed to fetch remote. Update canceled."
    exit 1
}

pull_error() {
    echo "Failed to pull update$1. Update canceled."
    exit 2
}

do_update() {
    echo "Downloading update$1..."
    git pull || pull_error "$1"
    echo "Update$1 downloaded."
}

cancel_update() {
    echo "Download canceled."
    exit 0
}

install_update() {
    echo "Installing update$1..."
    ./install.sh
    echo "Update$1 installed."
    exit 0
}

cancel_install() {
    echo "Installation canceled. Run updcfgs in your terminal to install update$1 manually."
}

main() {
    git fetch >/dev/null || fetch_error

    current_branch="$(git branch --show-current)"
    new_commits="$(git log "${current_branch}"..origin/"${current_branch}" --oneline)"

    if [ -z "$new_commits" ]; then
        echo "Already up-to-date."
        exit 0
    fi

    num_new_commits="$(echo "$new_commits" | wc -l)"
    updates_plural="s"
    if [ "$num_new_commits" == "1" ]; then
        updates_plural=""
    fi

    echo "$num_new_commits update$updates_plural available (listed newest to oldest):"
    echo "$new_commits"

    while true; do
        read -p "Download update$updates_plural? (Y/n) " yn
        yn="${yn:-y}"
        case $yn in
            [Yy]* ) do_update "$updates_plural"; break;;
            [Nn]* ) cancel_update;;
        esac
    done

    while true; do
        read -p "Install update$updates_plural? (Y/n) " yn
        yn="${yn:-y}"
        case $yn in
            [Yy]* ) install_update "$updates_plural";;
            [Nn]* ) cancel_install "$updates_plural";;
        esac
    done
}

main "$@"
