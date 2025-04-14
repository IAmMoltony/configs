#!/usr/bin/true

random_insult() {
    mapfile -t insults < "$(dirname $0)"/insults.txt
    echo "${insults[RANDOM % ${#insults[@]}]}"
}
