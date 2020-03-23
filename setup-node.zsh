#!/usr/bin/env zsh

echo "\n~~~ Starting Node Setup ~~~\n"

# Installation unnecessary; it's already in Brewfile.
# See zshrc for N_PREFIX and N_PREFIX/bin addition to PATH.

if exists node; then
  echo "Node Version: $(node --version)"
  echo "NPM Version: $(npm --version)"
else
  n latest # or lts
fi

