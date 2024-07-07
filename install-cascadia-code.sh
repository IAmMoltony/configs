#!/bin/sh

set -e

DLCC_Wget() {

    if ! wget https://github.com/microsoft/cascadia-code/releases/download/v2404.23/CascadiaCode-2404.23.zip; then
        # non-zero error code means bad
        echo "Failed to download cascadia code!!!! try again next time and make sure your internet workd!!!!"
        exit 1
    fi
}

DLCC_Curl() {
    if ! curl -O https://github.com/microsoft/cascadia-code/releases/download/v2404.23/CascadiaCode-2404.23.zip; then
        # non-zero error code means bad
        echo "failed to download cascadia code!!!!!! Try again next time and make sure that your wifi is plugged in"
        exit 1
    fi
}

check_if_cascadia_code_is_installed_already() {
    if fc-list | grep -q "Cascadia Code"; then
        echo "Yo cascadia code is already installed you vibing fr!!!"
        echo "If it doesn't work then delete it and run this script again"
        exit
    fi
}

check_if_cascadia_code_is_installed_already

echo "INSTALLING CASCADIA CODE!!!"

# Create and cd into a temp folder
mkdir -p _Tmp
cd _Tmp

echo "Downloading cascadia code ..."
if command -v wget > /dev/null 2>&1; then
    # Wget found so try using it
    DLCC_Wget
else
    # Wget not found, try curl
    if command -v curl > /dev/null 2>&1; then
        DLCC_Curl
    else
        # neither were found
        echo "Neither curl nor wget are found"
        echo "Please try again after installing curl or wget"
        exit 1
    fi
fi

# Extract the font
echo "Extracting cascadia code ..."
unzip CascadiaCode-2404.23.zip

# install it
# This installs system wide, I might want to add an option for installing for one user
# But I don't wanna since installing systmem wide works for me and that's all I really care about
echo "Installing fonts ..."
echo "You might have to enter your password cuz it's installing system wide"
sudo mkdir /usr/share/fonts/cascadiaCode
sudo mv ./otf /usr/share/fonts/cascadiaCode/otf
sudo mv ./ttf /usr/share/fonts/cascadiaCode/ttf
sudo mv ./woff2 /usr/share/fonts/cascadiaCode/woff2

# Update font cache so the user doesn't have to
echo "Updating font-cache ..."
fc-cache -fv

# Pai pai temp folder
echo "Cleaning up ..."
cd ..
rm -rf _Tmp

echo "Done!!!"
echo "Now you can use Cascadia Code font!"
