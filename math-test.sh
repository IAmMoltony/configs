#!/usr/bin/env bash

# Random insult
random_insult() {
    # thanks chatgpt for making this code shorter
    local insults=("big doofus" "disappointment" "failure" "garbage truck" "stupid" "cabbagehead" "silly goose" "clown" "potato brain" "cirno" "fricking lunatic" "drongo")
    echo "${insults[RANDOM % ${#insults[@]}]}"
}

# This runs on failure
mathtestfailure() {
    echo "You just failed the math test. You should be ashamed."
    ~/configs/mathtestctl.py addfail -n 1
}

# Math test C-c handler
mathtestnuhuh() {
    echo "You MUST do the math test!!"
}

# Math test~!
mathtestmain() {
    # Trap C-c to run the mathtestnuhuh function, so the user can't cheese by quitting.
    trap 'mathtestnuhuh' SIGINT

    local a=$(( RANDOM % 10 ))
    local b=$(( RANDOM % 10 ))

    # Choose a random operator: minus or plus.
    local ops=("-" "+")
    local operator=${ops[RANDOM % ${#ops[@]}]}

    # Calculate the answer.
    local realanswerwhichisdefinitelycorrect=$(($a "$operator" $b))

    local losercounter=0
    local wrongcounter=0
    while true; do
        # Read user's answer.
        read -p "$a $operator $b = " usersanswerwhichisprobablyincorrect

        # Make sure it's a number using this regular expression below.
        local re='^-?[0-9]+$'
        if ! [[ $usersanswerwhichisprobablyincorrect =~ $re ]]; then
            echo "Wtf?"
            (( losercounter++ ))
            if (( losercounter >= 5 )); then
                mathtestfailure
                break
            fi
            continue
        fi

        # Check the user's answer.
        if [ "$usersanswerwhichisprobablyincorrect" != "$realanswerwhichisdefinitelycorrect" ]; then
            # Incorrect answer.

            (( losercounter++ ))
            if (( losercounter >= 5 )); then
                mathtestfailure
                break
            fi

            echo "That ain't correct mate! Try again you $(random_insult)!" # australia moment
            (( wrongcounter++ ))
        else
            # Correct answer.

            # There is a 5% chance for the math test to "slip its mind", and continue regardless of whether the user's answer is correct or not.
            if [ $(( RANDOM % 100 )) -lt 5 ]; then
                echo "That totally slipped my mind. Try again."
                continue
            fi

            echo "Correct! Continue with whatever the hell you were doing."
            ~/configs/mathtestctl.py addwrong -n $wrongcounter
            ~/configs/mathtestctl.py addright -n 1
            break
        fi
    done

    # Unbind mathtestnuhuh from C-c.
    trap SIGINT
}

mathtestmain
