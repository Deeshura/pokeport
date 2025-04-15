#!/bin/sh

# A basic install script for the script

INSTALL_DIR='/usr/local/opt'
BIN_DIR='/usr/local/bin'

# Install prerequisite Python packages
pip install -r requirements.txt --root-user-action=ignore

# deleting directory if it already exists
rm -rf "$INSTALL_DIR/pokeport" || return 1

# making the necessary folder structure
mkdir -p $INSTALL_DIR/pokeport || return 1

# moving all the files to appropriate locations
cp pokeport.py $INSTALL_DIR/pokeport

# create symlink in usr/bin
rm -rf "$BIN_DIR/pokeport" || return 1
ln -s $INSTALL_DIR/pokeport/pokeport.py $BIN_DIR/pokeport

