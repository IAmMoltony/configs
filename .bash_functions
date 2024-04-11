# Create dir and cd into it
function mdcd() {
    md "$1" && cd "$1"
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

# Count all kinds of files in the current folder
cntfiles() {
    echo -e "\033[1;33mBlock special\033[0m: $(find . -maxdepth 1 -type b | wc -l)"
    echo -e "\033[1;32mCharacter special\033[0m: $(find . -maxdepth 1 -type c | wc -l)"
    echo -e "\033[1;34mDirectories\033[0m: $(find . -maxdepth 1 -mindepth 1 -type d | wc -l)"
    echo -e "\033[1;35mNamed pipes\033[0m: $(find . -maxdepth 1 -type p | wc -l)"
    echo -e "Regular files: $(find . -maxdepth 1 -type f | wc -l)"
    echo -e "\033[1;36mSymbolic links\033[0m: $(find . -maxdepth 1 -type l | wc -l)"
    echo -e "\033[1;31mSockets\033[0m: $(find . -maxdepth 1 -type s | wc -l)"
    echo -e "Total (including directories): $(find . -maxdepth 1 -mindepth 1 -type b,c,d,p,f,l,s | wc -l)"
    echo -e "Total (not including directories): $(find . -maxdepth 1 -mindepth 1 -type b,c,p,f,l,s | wc -l)"
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

# Git commit -am then push
gcampsh() {
    gcam "$1"
    git push
}

# Git commit -m then push
gcmpsh() {
    gcm "$1"
    git push
}

# Create a bookmark
newbkmk() {
    # check params
    if [ "$1" == "" ] || [ "$2" == "" ]; then
        echo "Usage: newbkmk <Folder> <Bookmark name>"
        return 1
    fi

    ln -s "$1" ~/Bookmarks/"$2"
}
