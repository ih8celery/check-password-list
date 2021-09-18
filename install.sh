#!/usr/bin/env bash

# check if arg given: it is dir to install in
INSTALL_DIR=~/bin
PASSWORD_FILENAME=vulnerable-passwords.txt
PASSWORD_LIST_URL=https://raw.githubusercontent.com/scipag/password-list/main/overall/password-list-all.txt
MY_PROJECT_SCRIPT_URL=https://raw.githubusercontent.com/ih8celery/check-password-list/check-password.py

if [[ $# -gt 0 -a -d "$1" ]]; then
    if [[ -d "$1" ]]; then
        INSTALL_DIR="$1"
        #TODO trim trailing slash from install dir if present
    else
        echo "Error: argument is not a directory"
        exit 1
    fi

fi

cd "${INSTALL_DIR}"

curl  "${PASSWORD_LIST_URL}" > "${PASSWORD_FILENAME}"

if [[ ! -e "${INSTALL_DIR}/${PASSWORD_FILENAME}" ]]; then
    echo "Error: could not download passwords file"
    exit 1
fi

curl  "${MY_PROJECT_SCRIPT_URL}" > check-passwords.py

if [[ ! -e "${INSTALL_DIR}/check-passwords.py" ]]; then
    echo "Error: could not download script file"
    exit 1
fi

chmod u+x "${INSTALL_DIR}/check-passwords.py"