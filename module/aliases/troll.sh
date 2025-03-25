#!/usr/bin/env bash

rm-roll() {
    alias rm='rm -iv'
    ((RANDOM % 100 < 20)) && {
        alias rm='echo -e "Sorry I dozed off a bit, try again" && true'
    }
    true
}
