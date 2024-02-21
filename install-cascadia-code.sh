#!/bin/sh

set -e

echo "INSTALLING CASCADIA CODE!!!"
mkdir _Tmp
cd _Tmp

echo "Downloading cascadia code ..."
wget https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip

echo "Extracting cascadia code ..."
unzip CascadiaCode-2111.01.zip

echo "Installing fonts ..."
echo "You might have to enter your password"
sudo mkdir /usr/share/fonts/cascadiaCode
sudo mv ./otf /usr/share/fonts/cascadiaCode/otf
sudo mv ./ttf /usr/share/fonts/cascadiaCode/ttf
sudo mv ./woff2 /usr/share/fonts/cascadiaCode/woff2

echo "Updating font-cache ..."
fc-cache -fv

echo "Cleaning up ..."
cd ..
rm -rf _Tmp

echo "Done!!!"
echo "Now you can use Cascadia Code font!"
