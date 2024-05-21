#!/usr/bin/python3

import sendemaillogger
import smtplib
from email.mime.text import MIMEText
import os
import json
import getpass

def read_config():
    with open("./credentials.json", "r") as config_file:
        return json.load(config_file)
    
def fix_wd():
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    os.chdir(dname)

def main():
    fix_wd()
    config = read_config()
    send()    

if __name__ == "__main__":
    main()
