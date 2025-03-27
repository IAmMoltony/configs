#!/usr/bin/env bash

source "$HOME/configs/random-insult.sh"

# This runs on failure
mathtestfailure() {
    echo "You just failed the math test. You should be ashamed."
    ~/configs/mathtestctl.py addfail -n 1
}

# Math test C-c handler
mathtestnuhuh() {
    echo "You MUST do the math test!!"
}

# Check for SUPER BALLS mode
superballs() {
    if [ $(( RANDOM % 100 )) -eq 1 ]; then
        echo "SUPER BALLS mode activated!!! Prepare to DIE!!!"
        return 0
    fi

    return 1
}

# MINNA!!!!!!!! CIRNO NO SANSUU KYOUSHITSU HAJIMARU YO!!!!!!!!!!!! ATAI MITAI TENSAI MEZASHITE GANBATTE ITTE NE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function ⑨() {
    if [ $(( RANDOM % 100 )) -le 5 ]; then
        return 0
    fi
    return 1
}

# Say a number really insultingly
number_but_very_insultingly() {
    declare -A digits=(
        [0]="ZERO"
        [1]="ONE"
        [2]="TWO"
        [3]="THREE"
        [4]="FOUR"
        [5]="FIVE"
        [6]="SIX"
        [7]="SEVEN"
        [8]="EIGHT"
        [9]="NINE"
    )

    local number="$1"
    local what=""

    for (( i=0; i<${#number}; i++ )); do
        digit="${number:$i:1}"
        result+="${digits[$digit]} "
    done

    echo "${result% }"
}

# Math test~!
mathtestmain() {
    # Trap C-c to run the mathtestnuhuh function, so the user can't cheese by quitting.
    trap 'mathtestnuhuh' SIGINT

    local SUPERBALLSmode=0
    ⑨ && {
        ~/configs/math-test-cirno.sh
        exit $?
    }
    superballs && SUPERBALLSmode=1

    if [ "$1" == "SUPERBALLStest" ]; then
        echo "Testing SUPER BALLS mode. C-c handler disabled."
        SUPERBALLSmode=1
        trap SIGINT
    fi

    if (( SUPERBALLSmode )); then
        local a=$(( RANDOM % 7000 + 2627 )) # 2627 chosen for no reason
        local b=$(( RANDOM % 7000 + 2627 ))
    else
        local a=$(( RANDOM % 10 ))
        local b=$(( RANDOM % 10 ))
    fi

    # Choose a random operator: minus or plus.
    if (( SUPERBALLSmode )); then
        local ops=("-" "+" "*")
    else
        local ops=("-" "+")
    fi
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
            if (( SUPERBALLSmode )); then
                insult="$(random_insult)"

                echo "That's NOT EVEN A NUMBER you JERK!!!!"
                echo "Scared of my math problem HUH!"
                echo "Adding TEN THOUSAND FAILURES TO YOUR RECORD!!!!!!!!!"
                ~/configs/mathtestctl.py addfail -n 10000
                echo "That will teach you not to mess with me..."
                echo "...you ${insult^^}!!!"
                break
            else
                echo "Wtf?"
                (( losercounter++ ))
                if (( losercounter >= 5 )); then
                    mathtestfailure
                    break
                fi
                continue
            fi
        fi

        # Check the user's answer.
        if [ "$usersanswerwhichisprobablyincorrect" != "$realanswerwhichisdefinitelycorrect" ]; then
            # Incorrect answer.

            if (( SUPERBALLSmode )); then
                # In SUPER BALLS mode, when you fail a question it tries to do as much psychological damage as possible.
                echo "HAH! YOU FAILURE!! The answer was $(number_but_very_insultingly "$realanswerwhichisdefinitelycorrect")!!!!!!!!!!! HOW could you NOT ANSWER THAT CORRECTLY???"
                echo "I used to walk to school in a TORNADO and walked UPHILL BOTH WAYS for TWENTY MILES across THE PACIFIC OCEAN!!!!! YOU ARE A COMPLETE DISAPPOINTMENT ${USER^^} and you KNOW THAT VERY WELL!!!!!!!!!!!!!!"
                ~/configs/mathtestctl.py addfail -n 1
                break
            fi

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

            if (( SUPERBALLSmode )); then
                echo "I bet you cheated."
                ~/configs/mathtestctl.py addright -n 1
                break
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

mathtestmain "$@"
