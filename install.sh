#!/bin/sh

# A basic install script for the script

INSTALL_DIR='/usr/local/opt'
BIN_DIR='/usr/local/bin'

# deleting directory if it already exists
rm -rf "$INSTALL_DIR/pokeport" || return 1

# making the necessary folder structure
mkdir -p $INSTALL_DIR/pokeport || return 1

# create virtual environment
mkdir -p /usr/local/opt/pokeport/.venv && python -m venv /usr/local/opt/pokeport/.venv

VIRTUAL_ENV=/usr/local/opt/pokeport/.venv
PATH=“$VIRTUAL_ENV/bin:$PATH” # add virtual environment to path; I hope this is ok!

source $VIRTUAL_ENV/bin/activate # activate virtual environment

# moving all the files to appropriate locations
cp pokeport.py $INSTALL_DIR/pokeport

# Install prerequisite Python packages
python -m pip install -r requirements.txt

# create symlink in usr/bin
rm -rf "$BIN_DIR/pokeport" || return 1
ln -s $INSTALL_DIR/pokeport/pokeport.py $BIN_DIR/pokeport

