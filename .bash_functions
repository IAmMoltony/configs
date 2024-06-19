#!/usr/bin/env bash
# vim:foldmethod=marker
# Moltony's Bash Functions

# Error handling {{{

BashFunctionsNumErrors=0

bferrorhdlr() {
    echo " ! Functions Init error on line $1"
    ((BashFunctionsNumErrors++))
}

trap 'bferrorhdlr $LINENO' ERR

# }}}

# Create dir and cd into it
mdcd() {
    mkdir "$1" && cd "$1" || return
}

# Create dir (with -p) and cd into it
mdpcd() {
    mkdir -p "$1" && cd "$1" || return
}

# Sync configs
synccfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync-commit.sh
    builtin cd "$oldpwd" || return
}

# Update configs
updcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./update.sh
    builtin cd "$oldpwd" || return
}

# Run git pull in configs
pllcfgs() {
    oldpwd="$(pwd)"
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
    builtin cd "$@" && ls --color=auto
}

# Git status of configs
gstcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git status
    builtin cd "$oldpwd" || return
}

# Push configs (e.g. incase of internet not being there when synccfgsing)
pshcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git push
    builtin cd "$oldpwd" || return
}

# Push savefiles
pshsf() {
    oldpwd="$(pwd)"
    builtin cd ~/savefiles || return
    git push
    builtin cd "$oldpwd" || return
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
    builtin cd ~/configs || return
    ./sync-commit.sh "$commitmsg"
    builtin cd "$oldpwd" || return
}

# Sync configs but show diff before
synccfgsmdff() {
    dffcfgs
    synccfgsm "$@"
}

# Count all kinds of files in the current folder
cntfiles() {
    dir="."
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

# Git diff for configs
dffcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git diff
    builtin cd "$oldpwd" || return
}

# Git diff for configs (no pager)
dffcfgsnp() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    ./sync.sh
    git --no-pager diff
    builtin cd "$oldpwd" || return
}

# Git commit -am then push
gcampsh() {
    git commit -am "$1"
    git push
}

# Git commit -m then push
gcmpsh() {
    git commit -m "$1"
    git push
}

# Git add git commit -m the push
gagcmpsh() {
    git add .
    git commit -m "$1"
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
    builtin cd ~/configs/HourlySyncLogs || return
    mrhsl=$(ls -Art | tail -n 1)
    echo "Most recent HSL: $mrhsl"
    cat "$mrhsl"
    builtin cd $oldpwd || return
}

# Git log in configs
glgcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git log
    builtin cd "$oldpwd" || return
}

# New exit alias
mkexitalias() {
    alias "$1"='exit'
}

# Create new aliases for basic interaction with a directory
# Argument 1: cd alias name (cdDIR) for cd'ing into the directory
# Argument 2: ls alias name (lsDIR) for listing the contents of the directory
# Argument 3: sz alias name (szDIR) for checking the size of the directory
# Argument 4: the path to the directory
mkdiralias() {
    alias "$1"="cd $6"
    alias "b$1"="builtin cd $6"
    alias "$2"="ls $6"
    alias "$3"="du $(readlink "$6" -m) --max-depth=1 --all -h | sort -h"
    alias "$4"="find $(readlink "$6" -m) -maxdepth 1 | wc -l"
    alias "$5"="cntfiles $(readlink "$6" -m)"
}

# mkdiralias but with common name patterns
mkcdiralias() {
    mkdiralias cd"$1" ls"$1" sz"$1" cnt"$1" cntf"$1" "$2"
}

# New edt + cat alias
# Used like:
#  mkecalias bashrc brc ~/.bashrc
#  mkecalias long short file
mkecalias() {
    long=$1
    short=$2
    file=$3
    alias edit-"$long"="$EDITOR $file"
    alias cat-"$long"="cat $file | less"
    alias view-"$long"="cat $file | less"
    alias catnp-"$long"="cat $file"
    alias viewnp-"$long"="cat $file"
    alias stat-"$long"="stat $file"
    alias edt"$short"="edit-$long"
    alias cat"$short"="cat-$long"
    alias catnp"$short"="catnp-$long"
    alias st"$short"="stat-$long"
}

# New edt + cat alias (sudo version)
mksuecalias() {
    long=$1
    short=$2
    file=$3
    alias edit-"$long"="sudo $EDITOR $file"
    alias cat-"$long"="cat $file | less"
    alias view-"$long"="cat $file | less"
    alias catnp-"$long"="cat $file"
    alias viewnp-"$long"="cat $file"
    alias stat-"$long"="stat $file"
    alias edt"$short"="edit-$long"
    alias cat"$short"="cat-$long"
    alias catnp"$short"="catnp-$long"
    alias st"$short"="stat-$long"
}

# New --color=auto alias (color auto sounds like colorado)
mkcolorado() {
    alias "$1"="$1 --color=auto"
}

# New TERM=xterm-265color alias (some programs don't support xterm-kitty)
mkxtfalias() {
    alias "$1"="TERM=xterm-256color $1"
}

# Today's commits in configs
cfg2dc() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    if [ "$1" == "np" ]; then
        git --no-pager log --oneline --since=midnight
    else
        git log --oneline --since=midnight
    fi
    builtin cd "$oldpwd" || return
}

# Today's commits in savefiles
sf2dc() {
    oldpwd="$(pwd)"
    builtin cd ~/savefiles || return
    if [ "$1" == "np" ]; then
        git --no-pager log --oneline --since=midnight
    else
        git log --oneline --since=midnight
    fi
    builtin cd "$oldpwd" || return
}

# Today's commits in commits and savefiles
cfgsf2dc() {
    echo " Configs:"
    cfg2dc np
    echo " Savefiles:"
    sf2dc np
}

# count files in dir
countfilesindir() {
    nf=$(ls -Al "$1" | wc -l)
    nff=$(( nf - 1 ))
    return $nff
}

# Check hourly sync logs
checkhsl() {
    if [ ! -e "$HOME/configs/HourlySyncLogs" ]; then
        echo "HSL directory not found or is not a directory, skipping HSL check."
        return
    fi
    countfilesindir ~/configs/HourlySyncLogs

    if (( $? > 30 )); then
        countfilesindir ~/configs/HourlySyncLogs
        echo "There are currently $? hourly sync log files."
        while true; do
            read -n 1 -p "Delete? [y or n] " yn
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
    index=$(( RANDOM % size ))
    echo ${c[$index]}
}

# CLEANUP CHECKER 9000!!!
cleanupchecker9000() {
    if [ ! -f "$HOME/.restartssincecleanup" ]; then
        echo "Restarts since cleanup file not found, creating"
        echo "0" > "$HOME/.restartssincecleanup"
    else
        restartssincecleanup=$(cat "$HOME/.restartssincecleanup")
        numberregex='^[0-9]+$'
        if ! [[ $restartssincecleanup =~ $numberregex ]]; then
            echo "Restarts since cleanup file is broken, recreating"
            echo "0" > "$HOME/.restartssincecleanup"
        else
            ((restartssincecleanup++))
            echo "$restartssincecleanup" > "$HOME/.restartssincecleanup"

            if (( restartssincecleanup > 100 )); then
                echo "You have gone a hundred shell restarts without cleanup."
                while true; do
                    read -n 1 -p "Cleanup? [y or n] " yn
                    case $yn in
                        [Yy]* ) echo "0" > "$HOME/.restartssincecleanup"; docleanupping; echo "Cleanup done."; break;;
                        [Nn]* ) echo "Okay then."; break;;
                        * ) echo "Please answer properly!";;
                    esac
                done
            fi
        fi
    fi
}

# Reset restarts since cleanup file
rrsc() {
    rm -f ~/.restartssincecleanup
}

# Do the actual cleanupping
docleanupping() {
    ~/configs/cleanupping
    if command -v "apt" > /dev/null 2>&1; then
        while true; do
            read -n 1 -p "You seem to be on a Debian-based system. Run sudo apt update? [y or n] " yn
            case $yn in
                [Yy]* ) echo "Running!"; sudo apt update; echo "Done."; break;;
                [Nn]* ) echo "Okay then."; break;;
                * ) echo "Please answer properly!";;
            esac
        done
    fi
}

# i like trains
paravozik() {
    while true; do
        \sl
    done
}

# List functions
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
    size=${#d[@]}
    i=$(( RANDOM % size ))
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

# List TODOs in cfgs w/o .git
todocfgs() {
    grep --exclude-dir=.git -rnw ~/configs -e 'TODO'
}

# May the fourth be with you
maythe4() {
    if [ "$(LC_ALL='' date +"%b %d")" == "May 04" ]; then
        echo "May the fourth be with you!"
    fi
}

# Inconveniences
inconveniences() {
    rm-roll
    yeah=$(( RANDOM % 100 ))
    if (( yeah <= 3 )); then
        mathtest
    fi
}

# Random insult
# I don't feel like swearing honestly
random_insult() {
    in[0]="big doofus"
    in[1]="disappointment"
    in[2]="failure"
    in[3]="garbage truck"
    in[4]="stupid"
    in[5]="cabbagehead"
    in[6]="silly goose"
    in[7]="clown"
    in[8]="potato brain"
    in[9]="cirno"
    in[10]="fricking lunatic"
    numins=${#in[@]}
    bruh=$(( RANDOM % numins ))
    echo "${in[$bruh]}"
}

# Math test~!
mathtest() {
    trap 'mathtestnuhuh' SIGINT
    a=$(( RANDOM % 10 ))
    b=$(($RANDOM % 10))
    op[0]="+"
    op[1]="-"
    numops=${#op[@]}
    operator=${op[$(( RANDOM % numops ))]}
    realanswerwhichisdefinitelycorrect=$(( $a $operator $b ))
    losercounter=0
    wrongcounter=0
    while true; do
        read -p "$a $operator $b = " usersanswerwhichisprobablyincorrect
        re='^-?[0-9]+$'
        if ! [[ $usersanswerwhichisprobablyincorrect =~ $re ]]; then
            echo "Wtf?"
            (( losercounter++ ))
            if (( losercounter >= 5 )); then
                echo "You just failed the math test. You should be ashamed."
                ~/configs/mathtestctl.py addfail -n 1
                break
            fi
            continue
        fi

        if [ "$usersanswerwhichisprobablyincorrect" != "$realanswerwhichisdefinitelycorrect" ]; then
            (( losercounter++ ))
            if (( losercounter >= 5 )); then
                echo "You just failed the math test. You should be ashamed."
                ~/configs/mathtestctl.py addfail -n 1
                break
            fi
            echo "That ain't correct mate! Try again you $(random_insult)!" # australia moment
            (( wrongcounter++ ))
        else
            echo "Correct! Continue with whatever the hell you were doing."
            ~/configs/mathtestctl.py addwrong -n $wrongcounter
            ~/configs/mathtestctl.py addright -n 1
            break
        fi
    done

    trap SIGINT
}

# Math test C-c handler
mathtestnuhuh() {
    echo "You MUST do the math test!!"
}

# filled disk space percent
fdspercent() {
    df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//'
}

# cirno
cirnoday() {
    if [ "$(LC_ALL='' date +"%d %m")" == "09 09" ]; then
        echo "Happy Cirno day! (9)"
    fi
}

# formating
formating() {
    file="$1"
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

# Number of today's commits in configs
nctcfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git log --oneline --since=midnight | wc -l
    builtin cd "$oldpwd" || return
}

# Number of yesterday's commits in configs
ncycfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    git log --oneline --since=yesterday.midnight --until=midnight | wc -l
    builtin cd "$oldpwd" || return
}

# Number of today's commits in savefiles
nctsf() {
    oldpwd="$(pwd)"
    builtin cd ~/savefiles || return
    git log --oneline --since=midnight | wc -l
    builtin cd "$oldpwd" || return
}

# Number of yesterday's commits in savefiles
ncysf() {
    oldpwd="$(pwd)"
    builtin cd ~/savefiles || return
    git log --oneline --since=yesterday.midnight --until=midnight | wc -l
    builtin cd "$oldpwd" || return
}

# grep todos
grn2do() {
    dir="."
    if [ "$1" != "" ]; then
        dir="$1"
    fi
    grep --color -rn "$dir" -e TODO
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

    if ! alias "$1" 2>/dev/null && ! declare -f "$1" 2>/dev/null; then
        echo "I don't know!"
    fi
}

# count number of todays commits in: savefiles and configs
nctcfgssf() {
    echo "Configs: $(nctcfgs)"
    echo "Savefiles: $(nctsf)"
    echo "Total: $(( $(nctcfgs) + $(nctsf) ))"
}

# why do i have to make docs
ncycfgssf() {
    echo "Configs: $(ncycfgs)"
    echo "Savefiles: $(ncysf)"
    echo "Total: $(( $(ncycfgs) + $(ncysf) ))"
}

# Get configs version (commit hash)
vercfgs() {
    oldpwd="$(pwd)"
    builtin cd ~/configs || return
    echo "$(git rev-parse --short HEAD) \"$(git log --format=%B -n 1 HEAD)\" (released $(LANG=en git show --no-patch --format="%ar" HEAD))"
    builtin cd "$oldpwd" || return
}

# Bashrc post-init functions
bashrc-postinit() {
    echo -e "\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0;35m=\033[0;34m=\033[0m"

    echo -e "Hi \033[0;32m$USER\033[0m!"
    dotw="$(LC_ALL=C date +"%A")"
    if [ "$dotw" == "Friday" ]; then
        echo "ITS FRIDAY!!!!!!!!!"
    else
        echo -e "It is currently \033[0;36m$(LC_ALL=C date +"%H:%M %p")\033[0m on $(adelightful) \033[0;36m$dotw\033[0m."
    fi

    echo -e "Running configs version \033[0;32m$(vercfgs)\033[0m."

    if (( $(date +"%k") < 6 )); then
        echo "Why are you up so late?"
    fi

    hcs-is-enabled --color
    cleanupchecker9000

    if [ -d "$HOME/configs/HourlySyncLogs" ]; then
        echo -e "Hourly sync logs take up \033[1;33m$(du -sh ~/configs/HourlySyncLogs | awk '{ print $1 }').\033[0m"
    fi

    echo -e "This computer has been up for \033[0;36m$(uptime -p | cut -c 4-)\033[0m."
    echo -e "Network usage today: \033[0;33m$(vnstat --oneline | awk -F';' '{print $6}')\033[0m."

    checkhsl

    echo -e "\033[0;36m$(alias | wc -l)\033[0m aliases and \033[0;36m$(lsfuncs | wc -l)\033[0m functions are installed."

    bdaycheck
    maythe4
    cirnoday

    if (( $(fdspercent) >= 80)); then
        echo -e "\033[0;31mWARNING YOU ARE RUNNING DANGEROUSLY LOW ON SPACE!!!!!!!!!!!!!\033[0m"
    fi

    if ll ~/Downloads/*.torrent > /dev/null 2>&1; then
        echo "There are torrent files in the Downloads folder:"
        find ~/Downloads -maxdepth 1 -name '*.torrent'
        while true; do
            read -n 1 -p "Is it okay to delete them? [y or n] " yn
            case $yn in
                [Yy]* ) echo "Alright, deleting!"; rm -f ~/Downloads/*.torrent; break;;
                [Nn]* ) echo "Okay then."; break;;
                * ) echo "Please answer properly!";;
            esac
        done
    fi

    BashrcEndTime=$(date +%s.%N)

    if command -v "bc" > /dev/null 2>&1; then
        BashrcRuntime=$(echo "scale=3; ($BashrcEndTime - $BashrcStartTime) / 1" | bc -l | awk '{printf "%.3f\n", $0}')
        echo "Shell initialized in $BashrcRuntime seconds with $BashrcNumErrors errors."
    else
        echo "Shell initialized with $BashrcNumErrors errors."
    fi

    # TODO time BA and BF
    echo "Aliases initialized with $BashAliasesNumErrors errors."
    echo "Functions initialized with $BashFunctionsNumErrors errors."

    # If bc isn't installed then tell
    if ! command -v "bc" > /dev/null 2>&1 && [ ! -f "$HOME/.idontwanttoinstallbc" ]; then
        echo -e "Shell init timing is \033[0;31munavailable\033[0m."
        echo "To enable shell init timing, please install bc on your system."
        echo "To disable this message, run disablebchint."
    fi

    stty echo

    rm-roll # this is done at the end in order to make sure that rm works always in init
}

# User functions (Functions specific to the user, not synced to the github repo) {{{

ubferrorhdlr() {
    echo " ! User Function Init error on line $1"
    ((BashFunctionsNumErrors++))
}

trap 'ubferrorhdlr $LINENO' ERR

# TODO turn the if -f then source into a function
if [ -f "$HOME/.bash-configs/.userfunctions" ]; then
    source "$HOME/.bash-configs/.userfunctions"
fi

# }}}

