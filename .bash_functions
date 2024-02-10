function mdcd() {
    md $1 && cd $1
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
