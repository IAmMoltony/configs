# Count all kinds of files in the current folder
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
