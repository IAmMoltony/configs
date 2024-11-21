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
./install.sh

echo "Configs installed!"
echo "Please restart your shell to apply new shell configuration."
