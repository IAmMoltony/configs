function mdcd() {
    md $1 && cd $1
}

function apt-full-update() {
    sudo apt update && sudo apt upgrade -y
}

function synccfgs() {
    oldpwd="$(pwd)"
    cd ~/configs
    if [ "$1" == "--nopush" ]; then
        ./sync-commit.sh --nopush
    else
        ./sync-commit.sh
    fi
    cd $oldpwd
}

function updcfgs() {
    oldpwd="$(pwd)"
    cd ~/configs
    ./update.sh
    cd $oldpwd
}

catless() {
    cat $@ | less
}

install-aur() {
    mkdir -p "$HOME/aur"
    oldcwd=$(pwd)
    cd "$HOME/aur"
    git clone https://aur.archlinux.org/$1.git
    cd $1
    mkaur
    cd $oldcwd
}
