#!/usr/bin/env bash

# ===================================
# Utility functions
# ===================================
yonp() {
    read -p "$1 [y/N]: " yn
    case $yn in
        [Yy]* )
            return 1
        * )
            return 0
    esac
}

separator() {
    echo "===================="
}

isinstalled() {
    if command -v "$1" >/dev/null 2>&1; then
        return 0
    fi
    return 1
}

# ===================================
# Installer functions
# ===================================

# TODO verify these

KNOWN_DISTROS=(
    # Debian-like
    "debian"
    "ubuntu"
    "linuxmint"
    "pop"
    "elementary"

    # Fedora-like
    "fedora"
    "rhel"
    "centos"
    "almalinux"
    "rocky"

    # Arch-like (btw)
    "arch"
    "manjaro"
    "endeavouros"

    # SUSE-like
    "opensuse-leap"
    "opensuse-tumbleweed"
    "sles"

    # Misc
    "gentoo"
    # TODO
)

# Debian-like distros: use apt
DEBIANLIKE=(
    "debian"
    "ubuntu"
    "linuxmint"
    "pop"
    "elementary"
)

# Fedora-like distros: use dnf
FEDORALIKE=(
    "fedora"
    "rhel"
    "centos"
    "almalinux"
    "rocky"
)

# Arch-like distros: use pacman
ARCHLIKE=(
    "arch"
    "manjaro"
    "endeavouros"
)

# SUSE-like distros: use zypper
SUSELIKE=(
    "opensuse-leap"
    "opensuse-tumbleweed"
    "sles"
)

distroid() {
    . /etc/os-release
    echo "$ID"
}

is_debian() {
    local i=$(distroid)
    return [[ " ${DEBIANLIKE[@]} " =~ " ${i} " ]]
}

is_fedora() {
    local i=$(distroid)
    return [[ " ${FEDORALIKE[@]} " =~ " ${i} " ]]
}

is_arch() {
    local i=$(distroid)
    return [[ " ${ARCHLIKE[@]} " =~ " ${i} " ]]
}

is_suse() {
    local i=$(distroid)
    return [[ " ${SUSELIKE[@]} " =~ " ${i} " ]]
}

is_gentoo() {
    return [[ "$(distroid)" == "gentoo" ]]
}

instpkg() (
    if is_debian; then
        sudo apt install -y "$1"
    fi
)

chkdstr() {
}

viminst() {
    instpkg vim
}

# ===================================
# Installer main
# ===================================

chkdstr

echo "Welcome to the Configs Package Installer!"
echo "This program will guide you through installing recommended packages and tools on your system."
echo
yonp_shallbegin=$(yonp "Shall we begin?")

if [ "$yonp_shallbegin" == "0" ]; then
    echo "Setup canceled."
    exit 0
fi

separator
if isinstalled vim; then
    yonp_vimcfg=$(yonp "Vim is already installed on your system. Install plugins? You can skip this step if plugins are already installed or you don't want to install them.")
    if [ "$yonp_vimcfg" == "1" ]; then
        vimcfg
    else
        echo "Skipping vim configuration."
    fi
else
    yonp_viminst=$(yonp "Vim is not installed on this system. Would you like to install it?")
    if [ "$yonp_viminst" == "1" ]; then
        viminst
        yonp_vimcfg=$(yonp "Now that vim is installed, would you like to instll plugins?")
        if [ "$yonp_vimcfg" == "1" ]; then
            vimcfg
        else
            echo "Skipping vim configuration."
        fi
    else
        echo "Skipping vim installation."
    fi
fi
