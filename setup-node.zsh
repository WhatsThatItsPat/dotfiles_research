#!/usr/bin/env zsh

echo "\n~~~ Starting Node Setup ~~~\n"

# Node versions are managed with n, which is already in Brewfile.
# See zshrc for N_PREFIX and N_PREFIX/bin addition to $PATH.

if exists node; then
  echo "Node ($(node --version)) & NPM ($(npm --version)) already installed"
else
  echo "Installing Node and NPM..."
  n latest # or lts
fi


# Install NPM Packages
npm install --global firebase-tools
npm install --global @angular/cli
npm install --global @ionic/cli
npm install --global typescript
npm install --global json-server
npm install --global http-server


