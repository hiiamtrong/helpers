#!/bin/bash

if [ ! -f keyfile ]; then
    echo "Generating keyfile..."
    echo "Checking your operating system..."
    echo  "OS: $(uname -s)"

    if [ "$(uname -s)" = "Linux" ]; then
        echo "Generating keyfile for Linux..."
        openssl rand -base64 756 > keyfile \
        && sudo chmod 600 keyfile \
        && sudo chown 999 keyfile \
        && sudo chgrp 999 keyfile
    elif [ "$(uname -s)" = "Darwin" ]; then
        echo "Generating keyfile for MacOS..."
        openssl rand -base64 741 > keyfile \
        && sudo chmod 600 keyfile 

    fi

    echo "Keyfile generated."
else
    echo "Keyfile already exists."
fi
