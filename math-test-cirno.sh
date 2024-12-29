function NINE() {
    vine_boom
    echo "   ___"
    sleep 1
    vine_boom
    echo "  / _ \\"
    sleep 1
    vine_boom
    echo " | (_) |"
    sleep 1
    vine_boom
    echo "  \\__, |"
    sleep 1
    vine_boom
    echo "    / /"
    sleep 1
    vine_boom
    echo "   /_/"
    sleep 1
    vine_boom
    echo "⑨: Exactly!!"
    sleep 2
    vine_boom
    echo "⑨: It was 9!!!"
    sleep 2
    vine_boom
    echo "⑨: Until next time!"
    exit 69
}

function vine_boom() {
    ffmpeg -i ~/configs/bell.wav -f alsa default > /dev/null 2>&1 &
}

function Over_the_top_intro() {
    # TODO play cirnos perfect math class here
    clear
    vine_boom
    echo -e "\n\n\n\n\n           DO YOU KNOW WHAT TIME IT IS?"
    sleep 3
    clear
    vine_boom
    echo -e -n "\n\n\n\n\n           THAT'S RIGHT! IT'S TIME FOR..."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 3
    clear

    # In case ur blind it says cirnos perfect math class
    vine_boom
    echo " ██████╗██╗██████╗ ███╗   ██╗ ██████╗ ███████╗"
    sleep 0.1
    vine_boom
    echo "██╔════╝██║██╔══██╗████╗  ██║██╔═══██╗██╔════╝"
    sleep 0.1
    vine_boom
    echo "██║     ██║██████╔╝██╔██╗ ██║██║   ██║███████╗"
    sleep 0.1
    vine_boom
    echo "██║     ██║██╔══██╗██║╚██╗██║██║   ██║╚════██║"
    sleep 0.1
    vine_boom
    echo "╚██████╗██║██║  ██║██║ ╚████║╚██████╔╝███████║"
    sleep 0.1
    vine_boom
    echo " ╚═════╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝"
    sleep 0.1
    vine_boom
    echo
    sleep 0.1
    vine_boom
    echo "██████╗ ███████╗██████╗ ███████╗███████╗ ██████╗████████╗"
    sleep 0.1
    vine_boom
    echo "██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝"
    sleep 0.1
    vine_boom
    echo "██████╔╝█████╗  ██████╔╝█████╗  █████╗  ██║        ██║"
    sleep 0.1
    vine_boom
    echo "██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██╔══╝  ██║        ██║"
    sleep 0.1
    vine_boom
    echo "██║     ███████╗██║  ██║██║     ███████╗╚██████╗   ██║"
    sleep 0.1
    vine_boom
    echo "╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝"
    sleep 0.1
    vine_boom
    echo 
    sleep 0.1
    vine_boom
    echo "███╗   ███╗ █████╗ ████████╗██╗  ██╗"
    sleep 0.1
    vine_boom
    echo "████╗ ████║██╔══██╗╚══██╔══╝██║  ██║"
    sleep 0.1
    vine_boom
    echo "██╔████╔██║███████║   ██║   ███████║"
    sleep 0.1
    vine_boom
    echo "██║╚██╔╝██║██╔══██║   ██║   ██╔══██║"
    sleep 0.1
    vine_boom
    echo "██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║"
    sleep 0.1
    vine_boom
    echo "╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝"
    sleep 0.1
    vine_boom
    echo
    sleep 0.1
    vine_boom
    echo " ██████╗██╗      █████╗ ███████╗███████╗██╗"
    sleep 0.1
    vine_boom
    echo "██╔════╝██║     ██╔══██╗██╔════╝██╔════╝██║"
    sleep 0.1
    vine_boom
    echo "██║     ██║     ███████║███████╗███████╗██║"
    sleep 0.1
    vine_boom
    echo "██║     ██║     ██╔══██║╚════██║╚════██║╚═╝"
    sleep 0.1
    vine_boom
    echo "╚██████╗███████╗██║  ██║███████║███████║██╗"
    sleep 0.1
    vine_boom
    echo " ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝"
    sleep 5
    clear
}

# This function unmutes your speakers and sets them to 100%
WE_DO_A_BIT_OF_TROLLING() {
    amixer set Master unmute
    amixer set Master 100%
}

# Infringe on copyright
infringe_on_copyright() {
    while true; do
        ffmpeg -i ~/configs/Cirno.wav -af "bass=g=20" -f alsa default > /dev/null 2>&1 &
        sleep $(ffprobe -i ~/configs/Cirno.wav -show_entries format=duration -v quiet -of csv="p=0" | cut -d '.' -f 1)
    done &
}

function main() {
    # Now the following line is REALLY, R E A L L Y important.
    # It makes sure that when the script stops, the song ALSO stops.
    # Listening to high pitched bass boosted distorted first 5 seconds if cirno's perfect math class made me go insane.
    trap 'kill $(jobs -p)' EXIT

    if [ $(( RANDOM % 50 )) -lt 0 ]; then
        WE_DO_A_BIT_OF_TROLLING
    fi
    infringe_on_copyright
    Over_the_top_intro
    vine_boom
    echo -n "⑨: Today's question is.."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo
    sleep 3

    # and now we make the numbers
    local a=$((RANDOM % 6 ))
    local b=$((RANDOM % 6 ))
    local ops=("-" "+")
    local operator=${ops[RANDOM % ${#ops[@]}]}

    vine_boom
    read -p "$a $operator $b = " answer_or_something_idk
    local re='^-?[0-9]+$'
    if ! [[ $answer_or_something_idk =~ $re ]]; then
    vine_boom
        echo "⑨: Baka! Baka! That isn't a number!"
        sleep 2
    vine_boom
        echo "⑨: Well, not like it matters anyway! Because the real answer was.."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo -n "."
        sleep 0.6
        echo
        NINE
    fi

    if (( answer_or_something_idk == 9 )); then
    vine_boom
        echo "⑨: Nice job, ${USER^}! You totally nailed it!"
        sleep 2
    vine_boom
        echo "⑨: Hope to see you again!"
        exit 9
    fi

    vine_boom
    echo "⑨: Nope, that wasn't it!"
    sleep 2
    vine_boom
    echo -n "⑨: The real answer was..."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo -n "."
    sleep 0.6
    echo
    NINE
}

main
