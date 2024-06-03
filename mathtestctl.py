#!/usr/bin/python3

import argparse
import os
import sys
import json
from dataclasses import dataclass

__version__ = "1.0.1"


@dataclass
class MathTestStats:
    num_wrong: int
    num_right: int
    num_fail: int

    def __str__(self):
        return f"{self.num_wrong} wrong, {self.num_right} right, {self.num_fail} failed"

    def reset(self):
        self.num_wrong = 0
        self.num_right = 0
        self.num_fail = 0

    def save(self):
        stats_dict = {"w": self.num_wrong, "r": self.num_right, "f": self.num_fail}
        with open("./mts.json", "w", encoding="utf8") as mts_json:
            json.dump(stats_dict, mts_json)


def set_wd():
    script_path = os.path.abspath(__file__)
    script_dir = os.path.dirname(script_path)
    os.chdir(script_dir)


def load_current_stats():
    if not os.path.exists("./mts.json"):
        return MathTestStats(0, 0, 0)
    with open("./mts.json", "r", encoding="utf8") as mts_json:
        mts = json.load(mts_json)
        return MathTestStats(int(mts["w"]), int(mts["r"]), int(mts["f"]))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "action", type=str, choices=["addwrong", "addright", "addfail", "view", "reset"]
    )
    parser.add_argument("--number", "-n", type=int)
    parser.add_argument(
        "--version",
        "-V",
        action="version",
        version=f"%(prog)s {__version__}",
        help="display version and exit",
    )
    args = parser.parse_args()

    set_wd()
    current_stats = load_current_stats()

    if args.action == "view":
        print(current_stats)
    elif args.action == "reset":
        current_stats.reset()
    elif args.action == "addwrong":
        if args.number is None:
            print("please pass number")
            sys.exit(1)
        current_stats.num_wrong += args.number
        if args.number is None:
            print("please pass number")
            sys.exit(1)
    elif args.action == "addright":
        if args.number is None:
            print("please pass number")
            sys.exit(1)
        current_stats.num_right += args.number
    elif args.action == "addfail":
        current_stats.num_fail += args.number

    current_stats.save()
