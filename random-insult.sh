#!/usr/bin/true

random_insult() {
    mapfile -t insults < $HOME/configs/insults.txt
    echo "${insults[RANDOM % ${#insults[@]}]}"
}
