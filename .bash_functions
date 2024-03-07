function mdcd() {
    md $1 && cd $1
}

function synccfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    if [ "$1" == "--nopush" ]; then
        ./sync-commit.sh --nopush
    else
        ./sync-commit.sh
    fi
    builtin cd $oldpwd
}

function updcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./update.sh
    builtin cd $oldpwd
}

catless() {
    cat $@ | less
}

cd() {
    builtin cd "$@" && ls
}
