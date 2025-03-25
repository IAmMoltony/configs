#!/usr/bin/env bash

[ -f imrunningonwsl ] && {
    WslDisplay=$(grep nameserver /etc/resolv.conf | awk '{print $2}')
    export DISPLAY="${WslDisplay}:0.0"
}
