#! /bin/sh

# A basic script to uninstall
INSTALL_DIR='/usr/local/opt'
BIN_DIR='/usr/local/bin'

# Remove directories where files have been installed
rm -rf "$INSTALL_DIR/pokeport"
rm -rf "$BIN_DIR/pokeport"
