# Create dir and cd into it
function mdcd() {
    md $1 && cd $1
}

# Sync configs
function synccfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./sync-commit.sh
    builtin cd "$oldpwd"
}

# Update configs
function updcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./update.sh
    builtin cd "$oldpwd"
}

# Cat a file with pager (saves 3 keystrokes!)
catless() {
    cat $@ | less
}

# Convenience: make `cd' automagically ls
cd() {
    builtin cd "$@" && ls
}

# Git status of configs
gstcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    git status
    builtin cd "$oldpwd"
}

# Push configs (e.g. incase of internet not being there when synccfgsing)
pshcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    gpsh
    builtin cd "$oldpwd"
}

# Sync configs with a message
synccfgsm() {
    commitmsg="$1"
    if [ "$commitmsg" == "" ]; then
        echo -n "Please enter commit message >"
        read commitmsg
    fi
    if [ "$commitmsg" == "" ]; then
        echo "Please enter a commit message"
        return 1
    fi
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./sync-commit.sh "$commitmsg"
    builtin cd "$oldpwd"
}

# Sync configs but show diff before
synccfgsmdff() {
    dffcfgs
    synccfgsm
}

# Download music (call ~/Music/download)
dlmus() {
    oldpwd="$(pwd)"
    builtin cd ~/Music
    ./download
    builtin cd "$oldpwd"
}

# Count regular files and symlinks in the current folder
cntfiles() {
    echo "Regular files: $(find . -type f | wc -l)"
    echo "Symlinks: $(find . -type l | wc -l)"
}

# Git diff for configs
dffcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./sync.sh
    git diff
    builtin cd "$oldpwd"
}

# Git diff for configs (no pager)
dffcfgsnp() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    ./sync.sh
    git --no-pager diff
    builtin cd "$oldpwd"
}
