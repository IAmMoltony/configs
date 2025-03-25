#!/usr/bin/env bash

BashAliasesNumErrors=0

# TODO unset error handler when reloading ba/bf

baerrorhdlr() {
    echo " ! Alias Init error on line $1"
    ((BashAliasesNumErrors++))
}

trap 'baerrorhdlr $LINENO' ERR
