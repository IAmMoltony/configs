#!/bin/sh
# Printscreen keybinding

# check if scrot is installed
if ! command -v scrot >/dev/null 2>&1; then
    notify-send "scrot isn't installed, install it to screenshot, ok~?"
    exit 1
fi

# screenshots dir
screenshot_dir="$HOME/Bookmarks/Screenshots"
if [ ! -d "$screenshot_dir" ]; then
    screenshot_dir="$HOME" # put screenshots in home if no screenshots bookmark
fi

# take a screenshot!
if [ "$1" == "alt" ]; then
    scrot -s -e "mv \$f $screenshot_dir"
else
    scrot -s -e "mv \$f $screenshot_dir"
fi


# notification
notify-send "screenshot taken!"
