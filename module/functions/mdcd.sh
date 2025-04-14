# Create dir and cd into it
mdcd() {
    mkdir "$1" && cd "$1" || return
}

# Create dir (with -p) and cd into it
mdpcd() {
    mkdir -p "$1" && cd "$1" || return
}
