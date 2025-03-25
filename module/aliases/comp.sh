#!/usr/bin/env bash

# thank you chat jippity for the codez

_ssctl_lazy_load_completion() {
    if [ -f "/usr/share/bash-completion/completions/systemctl" ]; then
        source /usr/share/bash-completion/completions/systemctl
        complete -F _systemctl ssctl
        unset -f _ssctl_lazy_load_completion
    fi
}

complete -F _ssctl_lazy_load_completion ssctl
