# Create new aliases for basic interaction with a directory
# Argument 1: cd alias name (cdDIR) for cd'ing into the directory
# Argument 2: ls alias name (lsDIR) for listing the contents of the directory
# Argument 3: sz alias name (szDIR) for checking the size of the directory
# Argument 4: cnt alias name (cntDIR) for checking how many files are in the directory
# Argument 5: cntf alias name (cntfDIR) for checking how many files are in the directory (more detailed)
# Argument 6: cdr alias name (cdrDIR) for cd'ing into the directory but if it's a symlink, then go to wherever it points
# Argument 7: la alias name (laDIR) for listing the contents of the directory with hidden files
# Argument 8: the directory
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
mkcdiralias() {
    mkdiralias cd"$1" ls"$1" sz"$1" cnt"$1" cntf"$1" cdr"$1" la"$1" "$2"
}

# New edt + cat alias
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
mkcolorado() {
    ((NumAutoBashAliases++))
    alias "$1"="$1 --color=auto"
}

# New TERM=xterm-265color alias (some programs don't support xterm-kitty)
mkxtfalias() {
    ((NumAutoBashAliases++))
    alias "$1"="TERM=xterm-256color $1"
}
