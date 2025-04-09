# vim:foldmethod=marker
# shellcheck shell=bash
# shellcheck disable=SC2142
# shellcheck disable=SC2155
# Moltony's Bash Aliases

export BashAliasesStartTime=$(date +%s.%N)
load_module aliases
trap - ERR
export BashAliasesEndTime=$(date +%s.%N)
