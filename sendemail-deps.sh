#!/usr/bin/env bash

echo "Installing sendemail dependencies"

if ! command -v cpan > /dev/null 2>&1; then
    echo "cpan is not installed. Aborting"
    exit 2
fi

if [ "$(id -u)" != "0" ]; then
    echo "Please run this as root user, e.g.: sudo $0"
    exit 3
fi

set -e # if anything fails we quit immediately

echo "INSTALLING DEPENDENCIES FOR SENDEMAIL MODULE"
echo "THIS WILL TAKE A WHILE"

# Actually install
cpan JSON
cpan Email::Sender::Simple
cpan Email::Sender::Transport::SMTPS

echo "done"

