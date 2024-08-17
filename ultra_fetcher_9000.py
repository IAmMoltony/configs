#!/usr/bin/python3

import json
import subprocess
import os
import sys
from dataclasses import dataclass
from shutil import which

def is_real_command(exec_name):
    return which(exec_name) is not None

def cd_into_script_dir():
    os.chdir(os.path.dirname(os.path.abspath(__file__)))

@dataclass
class Fetch:
    execu: str
    args: list[str]

    def run(self):
        if not is_real_command(self.execu):
            return False

        expanded_args = []
        for arg in self.args:
            expanded_args.append(os.path.expanduser(arg))
        full_args = [self.execu] + expanded_args
        status = subprocess.call(full_args)

        return status == 0

def run_fetches(fetches):
    for fetch in fetches:
        if fetch.run():
            sys.exit(0)

def parse_fetches(config):
    cfg_fetches = config["fetches"]
    fetches = []
    for fetch in cfg_fetches:
        fetches.append(Fetch(fetch["exec"], fetch["args"]))
    return fetches

def load_config():
    with open("ultrafetcher9000cfg.json", "r", encoding="utf8") as ultrafetcher9000cfg:
        return json.load(ultrafetcher9000cfg)

def main():
    cd_into_script_dir()
    config = load_config()
    fetches = parse_fetches(config)
    run_fetches(fetches)

    print("Unable to fetch")
    fetch_names = []
    for fetch in fetches:
        fetch_names.append(fetch.execu)
    print(f"Tried: {', '.join(fetch_names)}")
    print("Please make sure one of these program is in your path.")
    sys.exit(1)

if __name__ == "__main__":
    main()
