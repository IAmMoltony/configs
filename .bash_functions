#!/usr/bin/env bash
# vim:foldmethod=marker
# shellcheck shell=bash
# Moltony's Bash Functions

# TODO make this modular

BashFunctionsStartTime=$(date +%s.%N)

# Error handling {{{

BashFunctionsNumErrors=0

bferrorhdlr() {
    echo " ! Functions Init error on line $1"
    ((BashFunctionsNumErrors++))
}

trap 'bferrorhdlr $LINENO' ERR

# }}}

NumAutoBashAliases=0

# Create dir and cd into it
#
#
#
mdcd() {
    mkdir "$1" && cd "$1" || return
}

# Create dir (with -p) and cd into it
#
#
#
mdpcd() {
    mkdir -p "$1" && cd "$1" || return
}

# Sync configs
#
#
synccfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync-commit.sh
    builtin cd "$oldpwd" || return
}

# Update configs
#
#
updcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./update.sh
    builtin cd "$oldpwd" || return
}

# Run git pull in configs
#
#
pllcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git pull
    builtin cd "$oldpwd" || return
}

# Cat a file with pager (saves 3 keystrokes!)
catless() {
    cat "$@" | less
}

# Convenience: make `cd' automagically ls
cd() {
    builtin cd "$@" && ls --color=auto -CF
}

# Git status of configs
#
#
gstcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git status
    builtin cd "$oldpwd" || return
}

# Push configs (e.g. incase of internet not being there when synccfgsing)
#
#
pshcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git push
    builtin cd "$oldpwd" || return
}

# Sync configs with a message
#
#
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
#
#
synccfgsmdff() {
    dffcfgs
    synccfgsm "$@"
}

# Sync configs, then reload bashrc
#
#
syncmrbrc() {
    synccfgsm "$@"
    source ~/.bashrc
}

# Sync configs, then reload aliases
#
#
syncmrba() {
    synccfgsm "$@"
    source ~/configs/.bash_aliases
}

# Sync configs, then reload functions
#
#
syncmrbf() {
    synccfgsm "$@"
    source ~/configs/.bash_functions
    trap - ERR
}

# Sync configs, then reload aliases and functions
#
#
syncmrbfba() {
    synccfgsm "$@"
    source ~/configs/.bash_functions
    source ~/configs/.bash_aliases
    trap - ERR
}

# Sync configs, then exit
#
#
syncmpaipai() {
    synccfgsm "$@"
    exit
}

# Count all kinds of files in the current folder
#
#
cntfiles() {
    local dir="."
    if [ "$1" != "" ]; then
        dir="$1"
    fi

    echo -e "\033[1;33mBlock special\033[0m: $(find "$dir" -maxdepth 1 -type b | wc -l)"
    echo -e "\033[1;32mCharacter special\033[0m: $(find "$dir" -maxdepth 1 -type c | wc -l)"
    echo -e "\033[1;34mDirectories\033[0m: $(find "$dir" -maxdepth 1 -mindepth 1 -type d | wc -l)"
    echo -e "\033[1;35mNamed pipes\033[0m: $(find "$dir" -maxdepth 1 -type p | wc -l)"
    echo -e "Regular files: $(find "$dir" -maxdepth 1 -type f | wc -l)"
    echo -e "\033[1;36mSymbolic links\033[0m: $(find "$dir" -maxdepth 1 -type l | wc -l)"
    echo -e "\033[1;31mSockets\033[0m: $(find "$dir" -maxdepth 1 -type s | wc -l)"
    echo -e "Total (including directories): $(find "$dir" -maxdepth 1 -mindepth 1 -type b,c,d,p,f,l,s | wc -l)"
    echo -e "Total (not including directories): $(find "$dir" -maxdepth 1 -mindepth 1 -type b,c,p,f,l,s | wc -l)"
}

# Count all kinds of files in the current folder and all its subfolders
#
#
cntfilesr() {
    local dir="."
    if [ "$1" != "" ]; then
        dir="$1"
    fi

    echo -e "\033[1;33mBlock special\033[0m: $(find "$dir" -type b | wc -l)"
    echo -e "\033[1;32mCharacter special\033[0m: $(find "$dir" -type c | wc -l)"
    echo -e "\033[1;34mDirectories\033[0m: $(find "$dir" -mindepth 1 -type d | wc -l)"
    echo -e "\033[1;35mNamed pipes\033[0m: $(find "$dir" -type p | wc -l)"
    echo -e "Regular files: $(find "$dir" -type f | wc -l)"
    echo -e "\033[1;36mSymbolic links\033[0m: $(find "$dir" -type l | wc -l)"
    echo -e "\033[1;31mSockets\033[0m: $(find "$dir" -type s | wc -l)"
    echo -e "Total (including directories): $(find "$dir" -mindepth 1 -type b,c,d,p,f,l,s | wc -l)"
    echo -e "Total (not including directories): $(find "$dir" -mindepth 1 -type b,c,p,f,l,s | wc -l)"
}

# Git diff for configs
#
#
dffcfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git diff
    builtin cd "$oldpwd" || return
}

# Git diff for configs (no pager)
#
# 
dffcfgsnp() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git --no-pager diff
    builtin cd "$oldpwd" || return
}

# Git commit -am then push
#
#
gcampsh() {
    git commit -am "$1"
    git push
}

# Git commit -m then push
#
#
gcmpsh() {
    git commit -m "$1"
    git push
}

# Git add git commit -m the push
#
#
gagcmpsh() {
    git add .
    git commit -m "$1"
    git push
}

# Same as the 3 above but for the custom push aliases
# (i use them for projects i keep both on local hosting and gh)

###########################################################
# github master
#
#
gcampghms() {
    git commit -am "$1"
    git push github master
}

#
#
gcampghmspaipai() {
    git commit -am "$1"
    git push github master
    exit
}

#
#
gcmpghms() {
    git commit -m "$1"
    git push github master
}

#
#
gcmpghmspaipai() {
    git commit -m "$1"
    git push github master
    exit
}

#
#
gagcmpghms() {
    git add .
    git commit -m "$1"
    git push github master
}

#
#
gagcmpghmspaipai() {
    git add .
    git commit -m "$1"
    git push github master
    exit
}

###########################################################
# github main

#
#
gcampghmn() {
    git commit -am "$1"
    git push github main
}

#
#
gcampghmnpaipai() {
    git commit -am "$1"
    git push github main
    exit
}

#
#
gcmpghmn() {
    git commit -m "$1"
    git push github main
}

#
#
gcmpghmnpaipai() {
    git commit -m "$1"
    git push github main
    exit
}

#
#
gagcmpghmn() {
    git add .
    git commit -m "$1"
    git push github main
}

#
#
gagcmpghmnpaipai() {
    git add .
    git commit -m "$1"
    git push github main
    exit
}

###########################################################
# origin master

#
#
gcampogms() {
    git commit -am "$1"
    git push origin master
}

#
#
gcampogmspaipai() {
    git commit -am "$1"
    git push origin master
    exit
}

#
#
gcmpogms() {
    git commit -m "$1"
    git push origin master
}

#
#
gcmpogmspaipai() {
    git commit -m "$1"
    git push origin master
    exit
}

#
#
gagcmpogms() {
    git add .
    git commit -m "$1"
    git push origin master
}

#
#
gagcmpogmspaipai() {
    git add .
    git commit -m "$1"
    git push origin master
    exit
}

###########################################################
# origin main

#
#
gcampogmn() {
    git commit -am "$1"
    git push origin main
}

#
#
gcampogmnpaipai() {
    git commit -am "$1"
    git push origin main
    exit
}

#
#
gcmpogmn() {
    git commit -m "$1"
    git push origin main
}

#
#
gcmpogmnpaipai() {
    git commit -m "$1"
    git push origin main
    exit
}

#
#
gagcmpogmn() {
    git add .
    git commit -m "$1"
    git push origin main
}

#
#
gagcmpogmnpaipai() {
    git add .
    git commit -m "$1"
    git push origin main
    exit
}

# Create a bookmark
#
#
newbkmk() {
    # check params
    if [ "$1" == "" ] || [ "$2" == "" ]; then
        echo "Usage: newbkmk <Folder> <Bookmark name>"
        return 1
    fi

    ln -s "$1" ~/Bookmarks/"$2"
}

# View most recent HSL
#
#
cmrhsl() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs/HourlySyncLogs || return
    local mrhsl=$(ls -Art | tail -n 1)
    echo "Most recent HSL: $mrhsl"
    cat "$mrhsl"
    builtin cd "$oldpwd" || return
}

# Generic dir git log
#
#
glgdir() {
    local oldpwd="$(pwd)"
    builtin cd "$1" || return
    git log
    builtin cd "$oldpwd" || return
}

# Generic dir git log reverse
#
#
glgrdir() {
    local oldpwd="$(pwd)"
    builtin cd "$1" || return
    git log --reverse
    builtin cd "$oldpwd" || return
}

# Generic dir git show head
#
#
gshhdir() {
    local oldpwd="$(pwd)"
    builtin cd "$1" || return
    git show HEAD
    builtin cd "$oldpwd" || return
}

# Git log in configs
#
#
glgcfgs() {
    glgdir ~/configs
}

# Git log reverse in configs
#
#
glgrcfgs() {
    glgrdir ~/configs
}

# Git show HEAD in configs
#
# 
gshhcfgs() {
    gshhdir ~/configs
}

# Alias-making functions {{{

# Create new aliases for basic interaction with a directory
# Argument 1: cd alias name (cdDIR) for cd'ing into the directory
# Argument 2: ls alias name (lsDIR) for listing the contents of the directory
# Argument 3: sz alias name (szDIR) for checking the size of the directory
# Argument 4: cnt alias name (cntDIR) for checking how many files are in the directory
# Argument 5: cntf alias name (cntfDIR) for checking how many files are in the directory (more detailed)
# Argument 6: cdr alias name (cdrDIR) for cd'ing into the directory but if it's a symlink, then go to wherever it points
# Argument 7: la alias name (laDIR) for listing the contents of the directory with hidden files
# Argument 8: the directory
#
#
mkdiralias() {
    ((NumAutoBashAliases += 8))
    alias "$1"="cd \"$8\" && cd_or_nah"
    alias "b$1"="builtin cd \"$8\" && bcd_or_nah"
    alias "$2"="ls \"$8\""
    alias "$3"="du $(readlink "$8" -m) --max-depth=1 --all -h | sort -h"
    alias "$4"="find $(readlink "$8" -m) -maxdepth 1 | wc -l"
    alias "$5"="cntfiles $(readlink "$8" -m)"
    alias "$6"="cd $(readlink "$8" -m) && cd_or_nah"
    alias "$7"="ls -A \"$8\""
}

# mkdiralias but with common name patterns
#
#
mkcdiralias() {
    mkdiralias cd"$1" ls"$1" sz"$1" cnt"$1" cntf"$1" cdr"$1" la"$1" "$2"
}

# New edt + cat alias
#
#
mkecalias() {
    ((NumAutoBashAliases += 5))
    local short=$1
    local file=$2
    alias edt"$short"="$EDITOR \$(readlink -m $file)"
    alias cat"$short"="cat $file | less"
    alias catnp"$short"="cat $file"
    alias st"$short"="stat $file"
    alias clip"$short"="clipfile $file"
}

# New edt + cat alias (sudo version)
#
#
mksuecalias() {
    ((NumAutoBashAliases += 5))
    local short=$1
    local file=$2
    alias edt"$short"="sudo $EDITOR $file"
    alias cat"$short"="cat $file | less"
    alias catnp"$short"="cat $file"
    alias st"$short"="stat $file"
    alias clip"$short"="clipfile $file"
}

# New --color=auto alias (color auto sounds like colorado)
#
#
mkcolorado() {
    ((NumAutoBashAliases++))
    alias "$1"="$1 --color=auto"
}

# New TERM=xterm-265color alias (some programs don't support xterm-kitty)
#
#
mkxtfalias() {
    ((NumAutoBashAliases++))
    alias "$1"="TERM=xterm-256color $1"
}

# }}}

# Today's commits in configs
#
#
cfg2dc() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    if [ "$1" == "np" ]; then
        git --no-pager log --oneline --since=midnight
    else
        git log --oneline --since=midnight
    fi
    builtin cd "$oldpwd" || return
}

# count files in dir
#
#
countfilesindir() {
    local nf=$(ls -Al "$1" | wc -l)
    local nff=$(( nf - 1 ))
    return $nff
}

# Get a random currency sign
#
#
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
#
#
lsfuncs() {
    declare -f | grep -E '^[^_].* \(\)'
}

# a delightful, an exquisite, a beautiful, etc.
#
#
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
#
#
catcfgcfg() {
    cat ~/configs/"$1"
}

# Disable post-init message telling you to install bc if it's not installed
#
#
disablebchint() {
    if [ -f "$HOME/.idontwanttoinstallbc" ]; then
        echo "The message is already disabled."
        return
    fi
    touch "$HOME/.idontwanttoinstallbc" && echo -e "Okay, you will not be annoyed again.\nRun enablebchint to enable the message."
}

# Enable bc hint if that's your thing
#
#
enablebchint() {
    if [ ! -f "$HOME/.idontwanttoinstallbc" ]; then
        echo "The message is already enabled."
        return
    fi
    # Non-alias rm is used here because there's a chance that rm trolling is enabled and also I don't want the message.
    \rm -f "$HOME/.idontwanttoinstallbc" && echo -e "Okay, you will be annoyed again.\nRun disablebchint to disable the message."
}

# List TODOs in cfgs w/o .git
#
#
todocfgs() {
    grep --color --exclude-dir=.git -rn ~/configs -e "TODO"
}

# May the fourth be with you
#
#
maythe4() {
    if [ "$(LC_ALL='' date +"%b %d")" == "May 04" ]; then
        echo "May the fourth be with you!"
    fi
}

# make a freaking rpg ahh dialog box
dialogbox() {
    clear
    echo "#------------------------------------------------#"
    echo "|                                                |"
    echo "| *                                              |"
    echo "|                                                |"
    echo "|                                                |"
    echo "|                                                |"
    echo "|                                                |"
    echo "|                                                |"
    echo "|                                                |"
    echo "|                                                |"
    echo "|                                                |"
    echo "#------------------------------------------------#"
    echo -en "\033[3;5H"
    local m="$1"
    local ln=3
    local cl=5
    for ((i=0; i<${#m}; i++ )); do
        local c="${m:$i:1}"
        if [ "$c" == $'\n' ]; then
            ln=$((ln + 1))
            cl=5
            echo -en "\033[$ln;5f"
        else
            echo -en "\033[$ln;${cl}f$c"
            cl=$((cl + 1))
        fi
        sleep 0.07
    done
    echo -en "\033[13;0H"
}

suddenly() {
    local a=$(alias | shuf -n1 | cut -d= -f1 | sed 's/alias //')
    if [[ -n "$a" ]]; then
        unalias "$a"
        dialogbox $'Suddenly...\n\nYou notice that something feels a bit off.'
    fi
}

# Inconveniences
inconveniences() {
    # Ensure inconveniences run
    DementiaShell=0

    # Inconvenience 1: airhead rm
    rm-roll

    # Inconvenience 2: Math test
    local yeah=$(( RANDOM % 100 ))
    if (( yeah <= 3 )); then
        ~/configs/math-test.sh
    fi

    # Inconvenience 3: 魔理沙は大変なものを盗んでいきました
    local hell_yeah=$(( RANDOM % 100 ))
    local hell_yeah2=$(( RANDOM % 100 ))
    if (( hell_yeah <= 1 )) && (( hell_yeah2 <= 1 )); then
        steal-your-precious-thing
    fi

    # Inconvenience 4: ...uh...I'm thinking...
    local kek=$(( RANDOM % 100 ))
    if (( kek <= 4 )); then
        thinking
    fi

    # Inconvenience 5: magically delete a random alias
    if (( RANDOM % 100 == 0 )); then
        suddenly
    fi

    DementiaShell=1
}

#
#
thinking() {
    local cmnd="$(history 1 | sed 's/^[ ]*[0-9]*[ ]*//')"

    while true; do
        local holds=(
            "Hold on..."
            "Hold up..."
            "Wait!"
            "Wait a second..."
            "Just a moment..."
            "Just a second..."
            "Hang on."
            "お兄ちゃん、ちょっと待って"
            "Not so fast!"
            "Hello, this is your terminal speaking."
        )
        local imthinkings=(
            "I'm thinking!"
            "Uhh..."
            "Processing what you just ran..."
            "Can't quite wrap my head around this right now."
            "I have brainrot"
            "Did I lock the door?.."
            "考えているの..."
            "I want a cheeseburger rn..."
            "Let me think about that first."
            "Googling '$cmnd'..."
        )

        local current_hold="${holds[RANDOM % ${#holds[@]}]}"
        local current_imthinking="${imthinkings[RANDOM % ${#imthinkings[@]}]}"

        echo "$current_hold"
        sleep 3
        echo "$current_imthinking"
        sleep 3

        # Inconvenience 4.1: chance to have dementia
        local insane=$(( RANDOM % 100 ))
        if (( insane <= 8 )); then
            echo "Actually... What is happening? Did I just... think? I can't quite remember. Let's think again."
            continue
        fi

        local refuse=$(( RANDOM % 100 ))
        if (( refuse < 3 )); then
            echo "Nah, I changed my mind. Figure it out yourself, $(random_insult)."
            return 1
        fi

        local ithoughts=(
            "Okay, I'm ready."
            "よくわかんないけどいいかも"
            "I don't quite get it, but should be good."
            "Sure yeah you just ran that"
            "I guess."
            "Ur command is hella awesome👍👍 run sudo rm -rf / --no-preserve-root next time!" # imagine if someone fell for that. can't be me
            "I have no idea what you meant by running '$cmnd'. That's such a stupid command. Why did you even run it." # tsun-tsun
        )
        echo "${ithoughts[RANDOM % ${#ithoughts[@]}]}"

        break
    done
}

source "$HOME/configs/random-insult.sh"

# T or G?
#
#
t_or_g() {
    local tg=("t" "t" "t" "t" "t" "g")
    echo "${tg[RANDOM % ${#tg[@]}]}"
}

# filled disk space percent
#
#
fdspercent() {
    df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//'
}

# cirno
#
#
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

# grep todos
grn2do() {
    local dir="."
    if [ "$1" != "" ]; then
        dir="$1"
    fi
    grep --color -rn "$dir" -e "TODO"
}

# Convert any file to a video
anyfilevid() {
    ffmpeg -f rawvideo -pixel_format rgb32 -video_size 32x32 -framerate 10.766666 -i "$1" -f u8 -ar 44100 -ac 1 -i "$1" -sws_flags neighbor -s 240x240 "$1".mp4
}

# GhostScript or Git Status?
gs() {
    echo "DID YOU MEAN GHOSTSCRIPT (1) OR GIT STATUS (2)"
    read -p "???>" bruh
    if [ "$bruh" == "1" ]; then
        /usr/bin/gs "$@"
    elif [ "$bruh" == "2" ]; then
        git status "$@"
    else
        echo "ok man"
    fi
}

# wtf is ...?
wtfis() {
    if [ "$1" == "" ]; then
        echo "wtf is WHAT? what do you want to check?"
        return
    fi

    if ! command -v "which" >/dev/null 2>&1; then
        echo "Just a heads up, you don't have \`which' installed."
    fi

    if ! alias "$1" 2>/dev/null && ! declare -f "$1" 2>/dev/null && ! which "$1" 2>/dev/null; then
        echo "I don't know!"
    fi
}

# Get configs version (commit hash and message)
vercfgs() {
    local oldpwd="$(pwd)"
    builtin cd ~/configs || return
    echo "\033[0;32m$(git rev-parse --short HEAD)\033[0m \"$(git log --format=%B -n 1 HEAD)\" \033[0;36m($(LANG=en git show --no-patch --format="%ar" HEAD))\033[0m"
    builtin cd "$oldpwd" || return
}

# Check for torrents in the downloads dir
torrentchecker() {
    if ll ~/Downloads/*.torrent > /dev/null 2>&1; then
        echo "There are torrent files in the Downloads folder:"
        find "$(readlink -m ~/Downloads)" -maxdepth 1 -name '*.torrent'
        while true; do
            read -n 1 -p "Is it okay to delete them? [y or n] " yn
            case $yn in
                [Yy]* ) echo "Alright, deleting!"; builtin rm -f ~/Downloads/*.torrent; break;;
                [Nn]* ) echo "Okay then."; break;;
                * ) echo "Please answer properly!";;
            esac
        done
    fi
}

# It's ok that I'm low on space
oklowspc() {
    touch "$HOME/.oklowspc"
    echo "Disabled low space message, run notoklowspc to enable"
}

# It's NOT ok that I'm low on space
notoklowspc() {
    rm -f "$HOME/.oklowspc"
    echo "Enabled low space message, run oklowspc to disable"
}

# Get low space threshold
lowspcthr() {
    if [ ! -f "$HOME/.lowspcthr" ]; then
        echo "80"
        return
    fi

    local filecontent=$(cat "$HOME/.lowspcthr")
    local numberregex='^[0-9]+$'
    if ! [[ $filecontent =~ $numberregex ]]; then
        echo "80"
    fi
    echo "$filecontent"
}

# Set low spacethresgold
setlowspcthr() {
    echo -n "Set low space threshold (0 - 100):"
    read lstr
    if ! [[ "$lstr" =~ ^[0-9]+$ ]]; then
        echo "What the hel"
        return
    fi
    echo "ok"
    echo "$lstr" > "$HOME/.lowspcthr"
}

# Remove low space threshold
rmlowspcthr() {
    echo "Deleting low space threshold file now"
    rm -f "$HOME/.lowspcthr"
}

# It doesn't actually break anything, it's just annoying.
pipbsp() {
    pip "$@" --break-system-packages
}

# PS1 Git
ps1gitinfo() {
    local branchname="$(git symbolic-ref HEAD 2>/dev/null)" || branchname="head chopped off"
    local realbranchname="${branchname##refs/heads/}"
    local c2dstr=""
    local c2d_log="$(git log --oneline --since=midnight 2>/dev/null || echo "")"
    local c2d_bytes="$(echo "$c2d_log" | wc -c)"
    local last_tag="$(git describe --tags --abbrev=0 2>/dev/null || echo "")"
    local tagstr=""
    if [ "$c2d_bytes" != "0" ] && [ "$c2d_bytes" != "1" ]; then
        c2dstr=" c2d=\033[38:5:48m$(echo "$c2d_log" | wc -l)\033[0m"
    fi
    if [ ! -z "$last_tag" ]; then
        tagstr=" tag=\033[38:5:48m$last_tag\033[0m"
    fi
    echo -e "[\033[38:5:202mgit\033[0m b=\033[38:5:48m$realbranchname\033[0m$c2dstr$tagstr] "
}

# Print what Rhythmbox song is playing rn
rbsongrn() {
    if ! command -v rhythmbox-client >/dev/null 2>&1; then
        return
    fi

    if ! rhythmbox-client --check-running; then
        return
    fi

    local songrn_raw="$(rhythmbox-client --print-playing-format="%tt")"
    local songrn=${songrn_raw%.*}
    echo -e "Currently playing: \033[0;36m$songrn\033[0m" # I really like cyan
}

# Nag the user for not using fastfetch
fastfetchnag() {
    echo "Hey, have you tried using fastfetch? It's fast, customizable and maintained!"
    echo "Check it out: https://github.com/fastfetch-cli/fastfetch"
    echo "Once you install it, it'll take priority over any other fetch utility."
    echo "Oh, did I mention that this message cannot be turned off?"
    echo "Well... unless you dig into configs and remove this message."
    echo "But you wouldn't do that, would you, sweetheart~?"
    echo "I mean, I can't blame you if you do, people have preferences, but..."
    echo "fastfetch is just better. Please use that, would you?"
}

# Vim CoC install
vimci() {
    vim +"CocInstall $*"
}

# PS1 command status
ps1cs() {
    if [ "$?" == "0" ]; then
        echo -e "\033[0;32mok\033[0m "
    else
        echo -e "\033[0;31muh\033[0m "
    fi
}

# Git clone until succeed
gclnus() {
    echo "Running git clone with args: $* until succeed"
    echo "Press C-c to exit"
    while true; do
        if ! git clone "$@"; then
            echo "Failure try again"
            continue
        fi
        break
    done
}

# Choose between mpv config for fast or slow computer
mpvcfgset() {
    # check if mpv config is ther
    if [ ! -f "$HOME"/.config/mpv/mpv.conf ]; then
        echo "mpv config not found"
        echo "Please re-run the configs installer."
        return 1
    fi

    # check if its a symlink
    if [ ! -L "$HOME"/.config/mpv/mpv.conf ]; then
        echo "mpv config is NOT a symlink"
        echo "Please re-run the configs installer."
        return 1
    fi

    # bash arrays are so fucking stupid
    local choices=("$HOME/configs/mpv-fastcomputer.conf" "$HOME/configs/mpv-slowcomputer.conf")
    local choice_indexes=${!choices[*]}
    local num_choices=${#choices[*]}

    echo "mpv config is currently linked to $(readlink "$HOME"/.config/mpv/mpv.conf)"
    echo "It can be linked to one of the following:"

    # print every choice
    for i in $choice_indexes; do
        echo "$((i + 1)). ${choices[$i]}"
    done

    read -p "Choose what file to link to (enter a number from 1 to $num_choices): " choice
    
    local choice_minus_one=$(( choice - 1 )) # yuh
    if [[ ! " ${choice_indexes[@]} " =~ " $choice_minus_one " ]]; then
        echo "That's not an option!"
        return 1
    fi

    echo "Linking mpv config to ${choices[$choice_minus_one]}"
    ln -sf "${choices[$choice_minus_one]}" "$HOME"/.config/mpv/mpv.conf
}

# cd if there's an argument
cd_or_nah() {
    if [ -n "$1" ]; then
        cd "$1" || return
    fi
}

# cd_or_nah (builtin edition)
bcd_or_nah() {
    if [ -n "$1" ]; then
        builtin cd "$1" || return
    fi
}

# Git status.
gst() {
    # so basically whenever i do some changes in git i tend to like run git statuds
    # and gst was an alias for it
    # and sometimes i run it in my home folder expecting it to git status the configs
    # so this checks if im in home
    # if i am it shows configs git status
    # if not it does git status normally

    if [ "$(pwd)" == "$HOME" ]; then
        local oldpwd="$(pwd)"
        builtin cd "$HOME/configs" || return
        git status "$@"
        builtin cd "$oldpwd" || return
    else
        git status "$@"
    fi
}

# Git diff.
gdff() {
    # same situation as gst

    if [ "$(pwd)" == "$HOME" ]; then
        local oldpwd="$(pwd)"
        builtin cd "$HOME/configs" || return
        git diff "$@"
        builtin cd "$oldpwd" || return
    else
        git diff "$@"
    fi
}

# Git log.
glg() {
    # ok

    if [ "$(pwd)" == "$HOME" ]; then
        local oldpwd="$(pwd)"
        builtin cd "$HOME/configs" || return
        git log "$@"
        builtin cd "$oldpwd" || return
    else
        git log "$@"
    fi
}

# Git log tag..HEAD
glgth() {
    git log "$@"..HEAD
}

# random sudo prompt
randomsudoprompt() {
    local prompts=(
        "enter ur password pretty please $USER chan (i will not tell anyone uwu): "
        "Quick! I don't have much time! Type in your password!"
        "I am once again asking for your password. "
        "Ehmm what was your password again?.. "
        "ton mot de passe: "
        "Permission denied... unless you tell me your password. "
        "You know the deal $USER. "
        "Super user do but only after you type your password. "
        "FREEZE!! Password NOW! "
        "go ahead put it in "
        "Enter your password or get fanum taxed: "
        "rizz me up with ur password "
        "[sudo] password for your heart: "
        "お兄ちゃんのパスワード、お願い！" # lol
    )
    echo "${prompts[RANDOM % ${#prompts[@]}]}"
}

misspell_did() {
    misspellings=(
        "diD"
        "eid"
        "Dod"
        "sId"
        "dDid"
    )
    echo "${misspellings[RANDOM % ${#misspellings[@]}]}"
}

misspell_you() {
    misspellings=(
        "u"
        "U"
        "ypu"
        "yO u"
        "y0u"
        "YU"
        "ユー"
        "yui" # IS THAT A MFING けいおｎ REFERENCE???????????????????
    )
    echo "${misspellings[RANDOM % ${#misspellings[@]}]}"
}

misspell_actually() {
    misspellings=(
        "actuiallyu"
        "AxtullY"
        "ACYUALY"
        "caCtuSally"
        "CACtusALLy"
        "ac ftyrusy"
        "actually6"
    )
    echo "${misspellings[RANDOM % ${#misspellings[@]}]}"
}

misspell_want() {
    misspellings=(
        "wanr"
        "sAnt"
        "wn gt"
        "Wnat"
        "ean tY"
    )
    echo "${misspellings[RANDOM % ${#misspellings[@]}]}"
}

misspell_to() {
    misspellings=(
        "two"
        "2"
        "Too"
        "200"
        "TOo"
    )
    echo "${misspellings[RANDOM % ${#misspellings[@]}]}"
}

misspell_exit() {
    misspellings=(
        "exitr"
        "EUIXt"
        "xeit5"
        "ext7"
        "ex8t"
        "eXiti"
    )
    echo "${misspellings[RANDOM % ${#misspellings[@]}]}"
}

random_amount_of_question_marks() {
    random_amounts_of_question_marks=(
        "?????????????????????"
        "???????????????"
        "?????????????????????????????????"
        "????????????????????????????"
        "?????????????????"
        "??????????"
        "? ? ?"
        "???????????????????"
        "???????"
        "????????????????????????"
        "?????????????"
        "???????????????????????"
        "???????????????????????????????"
        "??????????????????????????"
        "????????????"
        "???????"
        "????"
        "?"
        "?????"
        "???????????"
        "?????????????????",
        "?????????????????????",
        "" # 0 is also random
    )
    echo "${random_amounts_of_question_marks[RANDOM % ${#random_amounts_of_question_marks[@]}]}"
}

# qfeoijqefojidqfwjiojoieqfojiefoiefjwfeefiwjfejiefjiwofieojwefwoijefwoijfeoijfeoijf4jfjifjfi
exit() {
    local balls=$((RANDOM % 50 ))
    if (( balls <= 30 )); then
        while true; do
            echo "$(misspell_did) $(misspell_you) $(misspell_actually) $(misspell_want) $(misspell_to) $(misspell_exit) $(random_amount_of_question_marks)"
            read -n 1 -p "YES OR NO" yn
            echo
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) return;;
                * ) echo "in case you have hearing loss, i will repeat again:";;
            esac
        done
    fi
    local heheh=$(( RANDOM % 100 ))
    if (( heheh <= 10 )); then
        echo "Not until you solve a tiny little math problem."
        ~/configs/math-test.sh
    fi
    builtin exit "$@"
}

# update dnf till succeed
sduyus() {
    while true; do
        if sudo -p "$(randomsudoprompt)" dnf update; then
            break
        fi
    done
}

# wget till suced
wgetus() {
    while true; do
        if wget "$@"; then
            break
        fi
    done
}

# Same as the clipfile alias but for wayland
clipfile-wl() {
    cat "$1" | wl-copy
}

# Nose noes
peanut_butter() {
    local noses=("noes" "nose" "noes" "noes" "noes" "noes" "noes" "noes" )
    echo "${noses[RANDOM % ${#noses[@]}]}"
}

# Do literally nothing
do-literally-nothing() {
    true
}

# da ze
steal-your-precious-thing() {
    # prevent the user from canceling the moratorium
    trap 'do-literally-nothing' SIGINT

    ffplay ~/configs/womp_womp.wav -nodisp > /dev/null 2>&1 &
    echo "Oh $(peanut_butter)!"
    echo "Marisa stole your precious thing!"
    echo "As a result, your terminal session will now be terminated da ze."
    echo "Womp womp indeed."

    # Dramatic pause...!
    sleep 12.6 # this used to be pi until the sound clip was added.

    # And die now
    pkill -9 kitty
}

# chan kun or smh idk
some_chan() {
    local asdfghjkl=("chan" "kun" "san")
    echo "${asdfghjkl[RANDOM % ${#asdfghjkl[@]}]}"
}

# check quality of picture
imql() {
    identify -verbose "$1" | grep "Quality"
}

# run docker without selinux
s0sdcu() {
    sudo -p "$(randomsudoprompt)" setenforce 0
    sudo docker compose up
    sudo -p "$(randomsudoprompt)" setenforce 1
}

# confirm unzip
cuz() {
    zipinfo "$1"
    while true; do
        read -n 1 -p "ok? [y or n] " yn
        case $yn in
            [Yy]* ) unzip "$1"; break;;
            [Nn]* ) echo "ok"; return 1;;
            * ) echo "please answer properly";;
        esac
    done
}

# lq but reverse (see module aliases/manual/ls module)
lqr() {
    ls -tl -1 "$@" | tac
}

reloadcpath() {
    . ~/.custompath
    export PATH="$PATH:$CUSTOMPATH"
}

# Print information about the distribution currently used (name and version)
# for prompt
dstrinfo() {
    if [ -r /etc/os-release ]; then
        . /etc/os-release
        echo -e "[\033[0;32m$ID \033[0;36m${VERSION_ID%%.*}\033[0m]"
    else
        echo -e "[\033[0;31m???\033[0m]"
    fi
}

# Bashrc post-init {{{

# Goofy ahh 6 space echo
goofy_ahh_6_space_echo() {
    echo -e "      $1"
}

# ...without newline
goofy_ahh_6_space_echo_without_newline() {
    echo -en "      $1"
}

bashrc-postinit() {
    goofy_ahh_6_space_echo "\033[0;35m:)\033[0m Hi \033[0;32m${USER^}-$(some_chan)\033[0m! This is \033[0;32m$(hostname)\033[0m."

    local dotw="$(LC_ALL=C date +"%A")"
    [ "$dotw" == "Friday" ] && goofy_ahh_6_space_echo "\033[0;32m^^\033[0m ITS FRIDAY!!!!!!!!!" || goofy_ahh_6_space_echo "\033[0;36m**\033[0m It is currently \033[0;36m$(LC_ALL=C date +"%I:%M %p")\033[0m on $(adelightful) \033[0;36m$dotw\033[0m."

    goofy_ahh_6_space_echo "\033[0;36m**\033[0m Configs version: $(vercfgs)."

    [ $(date +"%k") -lt 6 ] && goofy_ahh_6_space_echo "\033[0;34m??\033[0m Why are you up so late?"

    goofy_ahh_6_space_echo_without_newline "\033[0;36m**\033[0m "
    hcs-is-enabled --color

    [ -d "$HOME/configs/HourlySyncLogs" ] && goofy_ahh_6_space_echo "\033[0;36m**\033[0m Hourly sync logs take up \033[1;33m$(du -sh ~/configs/HourlySyncLogs | awk '{ print $1 }').\033[0m"

    [ "$(uptime -p)" ] && goofy_ahh_6_space_echo "\033[0;36m**\033[0m This computer has been up for \033[0;36m$(uptime -p | cut -c 4-)\033[0m."

    if command -v vnstat >/dev/null 2>&1; then
        local net_usagi="$(vnstat --oneline | awk -F';' '{print $6}')"
        [ -n "$net_usagi" ] && goofy_ahh_6_space_echo "\033[0;36m**\033[0m Network usage today: \033[0;33m$net_usagi\033[0m."
    fi

    [ "$PIPENV_ACTIVE" == "1" ] && goofy_ahh_6_space_echo "\033[0;36m**\033[0m Running using pipenv."

    goofy_ahh_6_space_echo "\033[0;36m**\033[0m \033[0;36m$(alias | wc -l)\033[0m aliases (\033[0;33m$NumAutoBashAliases\033[0m of which are automa$(t_or_g)ic) and \033[0;36m$(lsfuncs | wc -l)\033[0m functions are installed."

    maythe4
    cirnoday

    [ "$PIPENV_ACTIVE" != "1" ] && torrentchecker
    rbsongrn

    if (( $(fdspercent) >= $(lowspcthr))) && [ ! -f "$HOME/.oklowspc" ]; then
        goofy_ahh_6_space_echo "\033[0;31m!!\033[0m \033[0;31mWARNING YOU ARE RUNNING DANGEROUSLY LOW ON SPACE!!!!!!!!!!!!!\033[0m"
        goofy_ahh_6_space_echo "\033[0;31m!!\033[0m Run \033[0;36moklowspc\033[0m to disable the above message. Run \033[0;36msetlowspcthr\033[0m to change low space threshold."
    fi

    local BashrcEndTime=$(date +%s.%N)

    if command -v "bc" > /dev/null 2>&1; then
        local BashrcRuntime=$(echo "scale=3; ($BashrcEndTime - $BashrcStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
        local BashAliasesRuntime=$(echo "scale=3; ($BashAliasesEndTime - $BashAliasesStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')
        local BashFunctionsRuntime=$(echo "scale=3; ($BashFunctionsEndTime - $BashFunctionsStartTime) / 1" | bc -l | awk '{if($0 ~ /^\./) print "0"$0; else print $0}')

        goofy_ahh_6_space_echo "\033[0;36m**\033[0m Init time total: $BashrcRuntime sec; aliases: $BashAliasesRuntime sec; functions: $BashFunctionsRuntime sec."
    fi

    [ "$BashrcNumErrors" != 0 ] && goofy_ahh_6_space_echo "\033[0;31m!!\033[0m $BashrcNumErrors errors occured while initializing shell."
    [ "$BashAliasesNumErrors" != 0 ] && goofy_ahh_6_space_echo "\033[0;31m!!\033[0m $BashAliasesNumErrors errors occured while initializing aliases."
    [ "$BashFunctionsNumErrors" != 0 ] && goofy_ahh_6_space_echo "\033[0;31m!!\033[0m $BashFunctionsNumErrors errors occured while initializing functions."

    if ! command -v "bc" > /dev/null 2>&1 && [ ! -f "$HOME/.idontwanttoinstallbc" ]; then
        goofy_ahh_6_space_echo "\033[0;31m!!\033[0m Shell init timing is \033[0;31munavailable\033[0m."
        goofy_ahh_6_space_echo "\033[0;31m!!\033[0m To enable shell init timing, please install bc on your system."
        goofy_ahh_6_space_echo "\033[0;31m!!\033[0m To disable this message, run \033[0;36mdisablebchint\033[0m."
    fi

    "$HOME"/configs/updater.sh
    rm-roll

    DementiaShell=1
}

# }}}

# User functions (Functions specific to the user, not synced to the github repo) {{{

ubferrorhdlr() {
    echo " ! User Function Init error on line $1"
    ((BashFunctionsNumErrors++))
}

trap 'ubferrorhdlr $LINENO' ERR

# Migration from old user functions location
if [ -f "$HOME/.bash-configs/.userfunctions" ]; then
    \mv "$HOME/.bash-configs/.userfunctions" "$HOME/.config/bash-configs/userfunctions"
fi

if [ -f "$HOME/.config/bash-configs/userfunctions" ]; then
    source "$HOME/.config/bash-configs/userfunctions"
fi

# }}}

trap - ERR

BashFunctionsEndTime=$(date +%s.%N)
