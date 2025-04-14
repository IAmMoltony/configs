# Sync configs
synccfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync-commit.sh
    builtin cd "$oldpwd" || return
}

# Update configs
updcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./update.sh
    builtin cd "$oldpwd" || return
}

# Run git pull in configs
pllcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git pull
    builtin cd "$oldpwd" || return
}

# Git status of configs
gstcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git status
    builtin cd "$oldpwd" || return
}

# Push configs (e.g. incase of internet not being there when synccfgsing)
pshcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git push
    builtin cd "$oldpwd" || return
}

# Sync configs with a message
synccfgsm() {
    local commitmsg="$1"

    if [ "$commitmsg" == "" ]; then
        echo -n "Please enter commit message >"
        read commitmsg
    fi
    if [ "$commitmsg" == "" ]; then
        echo "Please enter a commit message"
        return 1
    fi

    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync-commit.sh "$commitmsg" || return 1
    builtin cd "$oldpwd" || return
}

# Sync configs but show diff before
synccfgsmdff() {
    dffcfgs
    synccfgsm "$@"
}

# Sync configs, then reload bashrc
syncmrbrc() {
    synccfgsm "$@"
    source ~/.bashrc
}

# Sync configs, then reload aliases
syncmrba() {
    synccfgsm "$@"
    source ~/configs/.bash_aliases
}

# Sync configs, then reload functions
syncmrbf() {
    synccfgsm "$@"
    source ~/configs/.bash_functions
    trap - ERR
}

# Sync configs, then reload aliases and functions
syncmrbfba() {
    synccfgsm "$@"
    source ~/configs/.bash_functions
    source ~/configs/.bash_aliases
    trap - ERR
}

# Sync configs, then exit
syncmpaipai() {
    synccfgsm "$@"
    exit
}

# Git diff for configs
dffcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git diff
    builtin cd "$oldpwd" || return
}

# Git diff for configs (no pager)
dffcfgsnp() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git --no-pager diff
    builtin cd "$oldpwd" || return
}
