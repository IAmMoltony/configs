#!/usr/bin/env bash

alias lt='ls -lh --size -1 -S --classify' # ll + sort by size
alias lq='ls -tl -1' # List contents of dir, sort files by modification time and do a one-column display
alias lqa='la -tl -1' # Same as lq but also show hidden files (including . and ..)
alias l.='ls -d .* --color=auto' # List only hidden files
alias ls='ls -CF --color=auto' # ls but with the little asterisk afte rht executables and slash after folders and shit
alias ll='\ls -alF --color=auto' # ls with the list thing
alias la='ls -A --color=auto' # ls but show hidden
alias l='ls' # me when the backwards compatibility
alias lal='\ls -CFA --color=auto' # l and la combined
alias lsd='ls -d */' # Ls only dirs
