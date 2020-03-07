#!/usr/bin/env zsh

echo "\nStarting Hombrew Setup\n"

# This needs to happen earlier
# xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew bundle --verbose