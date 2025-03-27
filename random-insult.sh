#!/usr/bin/true

# TODO implement dynamic insult list loaded from file
random_insult() {
    local insults=("big doofus" "disappointment" "failure" "garbage truck" "stupid" "cabbagehead" "silly goose" "clown" "potato brain" "cirno" "fricking lunatic" "drongo")
    echo "${insults[RANDOM % ${#insults[@]}]}"
}
