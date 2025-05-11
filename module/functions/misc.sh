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
    local oldpwd="$(pwd)"
    builtin cd ~/configs/HourlySyncLogs || return
    local mrhsl=$(ls -Art | tail -n 1)
    echo "Most recent HSL: $mrhsl"
    cat "$mrhsl"
    builtin cd "$oldpwd" || return
}

# count files in dir
countfilesindir() {
    local nf=$(ls -Al "$1" | wc -l)
    local nff=$(( nf - 1 ))
    return $nff
}

# Get a random currency sign
randomcurrency() {
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
    local n=${#c[@]}
    local i=$(( RANDOM % n ))
    echo "${c[$i]}"
}

# List functions
# Do not remove as it's used in postinit for function count.
lsfuncs() {
    declare -f | grep -E '^[^_].* \(\)'
}

# a delightful, an exquisite, a beautiful, etc.
adelightful() {
    # d stands for delight
    d[0]="a delightful"
    d[1]="a beautiful"
    d[2]="an exquisite"
    d[3]="a lovely"
    d[4]="a pleasant"
    d[5]="a delicious" # why not
    d[6]="a heavenly"
    local size=${#d[@]}
    local i=$(( RANDOM % size ))
    echo "${d[$i]}"
}

# Cat a config in the repo
catcfgcfg() {
    cat ~/configs/"$1"
}

# Disable post-init message telling you to install bc if it's not installed
disablebchint() {
    if [ -f "$HOME/.idontwanttoinstallbc" ]; then
        echo "The message is already disabled."
        return
    fi
    touch "$HOME/.idontwanttoinstallbc" && echo -e "Okay, you will not be annoyed again.\nRun enablebchint to enable the message."
}

# Enable bc hint if that's your thing
enablebchint() {
    if [ ! -f "$HOME/.idontwanttoinstallbc" ]; then
        echo "The message is already enabled."
        return
    fi
    # Non-alias rm is used here because there's a chance that rm trolling is enabled and also I don't want the message.
    \rm -f "$HOME/.idontwanttoinstallbc" && echo -e "Okay, you will be annoyed again.\nRun disablebchint to disable the message."
}

# May the fourth be with you
maythe4() {
    if [ "$(LC_ALL='' date +"%b %d")" == "May 04" ]; then
        echo "May the fourth be with you!"
    fi
}

# T or G?
t_or_g() {
    local tg=("t" "t" "t" "t" "t" "g")
    echo "${tg[RANDOM % ${#tg[@]}]}"
}

# filled disk space percent
fdspercent() {
    df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//'
}

# cirno
cirnoday() {
    if [ "$(LC_ALL='' date +"%d %m")" == "09 09" ]; then
        echo "Happy Cirno day! (9)" # The reason I don't use the ⑨ character is because it looks like shit in many monospc fonts
    fi
}

# formating
formating() {
    local file="$1"
    if [ "$file" == "" ]; then
        echo "please giv file"
        return 1
    fi

    if [ ! -f "$file" ]; then
        echo "what file ?? ?"
        return 2
    fi

    black "$1"
    git commit -am "Format $file" # conveinent innit
}
