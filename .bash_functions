function mdcd() {
    md $1 && cd $1
}

function synccfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./sync-commit.sh
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

cfggst() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    git status
    builtin cd $oldpwd
}

pshcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    gpsh
    builtin cd $oldpwd
}

synccfgsm() {
    echo -n "Please enter commit message >"
    read commitmsg
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./sync-commit.sh "$commitmsg"
    builtin cd $oldpwd
}

dlmus() {
    oldpwd="$(pwd)"
    builtin cd ~/Music
    ./download
    builtin cd $oldpwd
}

cntfiles() {
    echo "Regular files: $(find . -type f | wc -l)"
    echo "Symlinks: $(find . -type l | wc -l)"
}
