
# configs

My config files for uhh stuff

## Installing config files

run `./install.sh` while being in the repo directory

## Putting your local config files into the repo

Run `./sync.sh` while being in the repo directory, or `./sync-commit.sh` if you also want to automatically commit with message "Sync". There is an alias called `synccfgs` in `.bash_aliases` which calls the script for you, but it also assumes that the script is located in `~/configs`.

If there are errors while executing `sync.sh` or `install.sh` then that's probably because you don't have a certain config or folder on your machine, which is fine.
