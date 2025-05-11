# Inconveniences
inconveniences() {
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
}

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
