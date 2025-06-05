#!/usr/bin/env bash

syscheck() {
    if ! command -v "git" >/dev/null 2>&1; then
        echo "Git is not installed on your system."
        return 1
    fi
    return 0
}

echo "Welcome to the Configs Super Convenient Installer™!"
echo "Checking your system..."

if ! syscheck; then
    echo "System check failed!"
    exit 1
fi

echo "System OK!"
echo "Downloading configs..."

if ! git clone https://github.com/IAmMoltony/configs.git "$HOME/configs"; then
    echo "Failed to download configs!"
    echo "Please check your internet connection and try again."
    exit 2
fi

echo "Downloaded successfully!"
echo "Running install script..."

cd "$HOME/configs"
./install.sh -fsl

echo
echo "*============================*"
echo "     Configs  Installed!      "
echo "*============================*"
echo 
echo "Thank you for using the Super Convenient Installer™. Run this to reload your shell configuration:"
echo
echo "    source ~/.bashrc"
echo
echo "It is highly recommended to install a few packages to consider the system fully set-up."
echo "Run this to install recommended software:"
echo
echo "    ~/configs/pkginst.sh"
