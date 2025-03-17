#!/usr/bin/env bash

# this is the bookmark maker
# makes bookmarks for new installs
# making bookmarks manually is honk shoo

mkdir -p "$HOME"/Bookmarks
ln -s "$HOME"/Downloads/anime "$HOME"/Bookmarks/Anime
ln -s "$HOME"/Downloads/cartoons "$HOME"/Bookmarks/Cartoons
ln -s "$HOME"/Downloads/images "$HOME"/Bookmarks/Downloaded\ images
ln -s "$HOME"/Downloads/games "$HOME"/Bookmarks/Game\ downloads
ln -s "$HOME"/Downloads/games/windows "$HOME"/Bookmarks/Game\ downloads\ \(Windows\)
ln -s "$HOME"/Downloads/games/linux "$HOME"/Bookmarks/Game\ downloads\ \(Linux\)
ln -s "$HOME"/Downloads/games/windows/touhou "$HOME"/Bookmarks/Game\ downloads\ \(Touhou\)
ln -s "$HOME"/Downloads/fonts "$HOME"/Bookmarks/Downloaded\ fonts
ln -s "$HOME"/Games/EmulatorGames "$HOME"/Bookmarks/Games\ \(emulator\)
ln -s "$HOME"/Downloads/isos "$HOME"/Bookmarks/ISOs
ln -s "$HOME"/Pictures/Screenshots "$HOME"/Bookmarks/Screenshots
ln -s "$HOME"/dev/IAmMoltony.github.io "$HOME"/Bookmarks/Website
ln -s "$HOME"/.wine "$HOME"/Bookmarks/Wine
ln -s "$HOME"/.wine64 "$HOME"/Bookmarks/Wine\ \(64-bit\)
ln -s "$HOME"/.local/share/wineprefixes "$HOME"/Bookmarks/Wine\ prefixes

echo "default ahh bookmarks made"
echo "delete/change location of bookmarks if necessary"
