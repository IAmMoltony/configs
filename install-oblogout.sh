#!/usr/bin/env bash

selfdestruct() {
    echo "THE INSTALLER HAS ENCOUNTERED A FATAL FAILURE"
    echo "please READ the error message and fix it urself"
    echo "self destructing..."
    exit 1
}

echo "o hi welcom to OBLOGOUT INSTALLER"
echo "this is version 1 point 2 of the installer (not the program)"
echo "instal oblogout??? (y or n)"
read -p "???? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "IM INSTALLIG OBLOGOUT RIGHT NOW!!!!!!!"

    if [ ! -d "$HOME/oblogout-py3" ]; then
        echo "STEP 1: clone oblogout"
        echo "it will be cloned in your home folder"
        git clone https://github.com/trizen/oblogout-py3 $HOME/oblogout-py3 || selfdestruct
        echo "ok i cloned it"
    else
        echo "attention rightn ow: oblogout has already been cloned"
    fi

    echo "STEP 2: instaling (you may nejed to enter your password)"
    cd $HOME/oblogout-py3
    sudo ./setup.py install || selfdestruct

    echo "STEP 3: installling themes (so that the buttons show up properly i dont know why it doesnt do it by default)"
    cd $HOME/oblogout-py3
    cp ./data/themes/* $HOME/.themes -r

    echo "INSTALLATIN HAS SUCCESSFULED!"
    echo "you can now use roblogout !!!"
else
    echo "ok bai"
fi
