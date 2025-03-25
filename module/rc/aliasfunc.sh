#!/usr/bin/env bash

. ~/configs/.bash_functions
. ~/configs/.bash_aliases

# BA and BF have their own error handler, this changes it
# to the BashRC one
trap 'brcerrorhdlr $LINENO' ERR
