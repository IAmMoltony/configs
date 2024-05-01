# Create dir and cd into it
function mdcd() {
    mkdir "$1" && cd "$1"
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

# View most recent HSL
cmrhsl() {
    oldpwd="$(pwd)"
    builtin cd ~/configs/HourlySyncLogs
    mrhsl=$(ls -Art | tail -n 1)
    echo "Most recent HSL: $mrhsl"
    cat "$mrhsl"
    builtin cd $oldpwd
}

# Git log in configs
glgcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs
    glg
    builtin cd $oldpwd
}

# New exit alias
mkexitalias() {
    alias $1='exit'
}

# New cd alias
mkcdalias() {
    alias $1="cd $2"
    alias b$1="cd $2"
}

# New edt + cat alias
# Used like:
#  mkecalias bashrc brc ~/.bashrc
#  mkecalias long short file
mkecalias() {
    long=$1
    short=$2
    file=$3
    alias edit-$long="$EDITOR $file"
    alias cat-$long="cat $file | less"
    alias view-$long="cat $file | less"
    alias edt$short="edit-$long"
    alias cat$short="cat-$long"
}

# New edt + cat alias (sudo version)
mksuecalias() {
    long=$1
    short=$2
    file=$3
    alias edit-$long="sudo $EDITOR $file"
    alias cat-$long="cat $file | less"
    alias view-$long="cat $file | less"
    alias edt$short="edit-$long"
    alias cat$short="cat-$long"
}

# Today's commits in configs
cfg2dc() {
    oldpwd="$(pwd)"
bcdcfg # Don't ask me why it has to be like this.
    todayscommits
    builtin cd "$oldpwd"
}

# count files in dir
countfilesindir() {
    nf=$(ls -Al $1 | wc -l)
    nff=$(( $nf - 1 ))
    return $nff
}

# Check hourly sync logs
checkhsl() {
    countfilesindir ~/configs/HourlySyncLogs

    if (( $? > 30 )); then
        countfilesindir ~/configs/HourlySyncLogs
        echo "There are currently $? hourly sync log files."
        while true; do
            read -p "Delete? [y or n] " yn
            case $yn in
                [Yy]* ) rm -rf ~/configs/HourlySyncLogs/*; echo "Deleted."; break;;
                [Nn]* ) echo "Okay, keeping."; break;;
                * ) echo "Please answer properly!";;
            esac
        done
    fi
}

# Birthday checker
bdaycheck() {
    source ~/.bday
    currentDate=$(LC_ALL=C date +"%b %d")
    if [ "$currentDate" == "$BDAY_EARLY" ]; then
        echo -e "Happy early birthday, \033[0;32m$USER!\033[0m"
    elif [ "$currentDate" == "$BDAY_EXACT" ]; then
        echo -e "Happy birthday, \033[0;32m$USER!\033[0m"
    elif [ "$currentDate" == "$BDAY_LATE" ]; then
        echo -e "Happy late birthday, \033[0;32m$USER!\033[0m"
    fi
}

# Get a random currency sign
randomcurrency() {
    # c stands for currencies
    c[0]="$"
    c[1]="₿"
    c[2]="¢"
    c[3]="֏"
    c[4]="€"
    c[5]="₴"
    c[6]="₱"
    c[7]="£"
    c[8]="₽"
    c[9]="₹"
    c[10]="₸"
    c[11]="₩"
    c[12]="¥"
    size=${#c[@]}
    index=$(($RANDOM % $size))
    echo ${c[$index]}
}
