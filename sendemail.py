#!/usr/bin/python3

import sendemaillogger
import smtplib
from email.mime.text import MIMEText
import os
import json
import getpass
import datetime
import argparse
import subprocess

__version__ = "1.0"

def read_config():
    with open("./credentials.json", "r") as config_file:
        return json.load(config_file)
    
def fix_wd():
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    os.chdir(dname)

def get_head_diff():
    show = subprocess.run(["git", "show", "HEAD"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return show.stdout

def send(hsl_text, config):
    sendemaillogger.log("Sending email now!")
    email_text = f"Dear {getpass.getuser()}, your configurations have been synchronized at {datetime.datetime.now().strftime('%F %T')}.\n\n{hsl_text}\n\nDiff:\n\n{get_head_diff()}\n\nSincerely, sendemail.py version {__version__}."
    message = MIMEText(email_text)
    message["Subject"] = f"Hourly config sync at {datetime.datetime.now().strftime('%F %T')}"
    message["From"] = config["from-who"]
    message["To"] = config["to-who"]
    smtp = smtplib.SMTP(config["smtp"], 25)
    smtp.connect(config["smtp"], 25)
    smtp.ehlo()
    smtp.starttls()
    smtp.ehlo()
    smtp.login(config["username"], config["password"])
    smtp.sendmail(config["from-who"], config["to-who"], message.as_string())
    smtp.quit()
    sendemaillogger.log("Email sending is now done thank you")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("hsl", type=str, help="The HSL to use")
    args = parser.parse_args()

    fix_wd()
    config = read_config()
    hsl_text = ""
    with open(args.hsl, "r") as hsl:
        hsl_text = hsl.read()
    send(hsl_text, config)

if __name__ == "__main__":
    main()
