#!/usr/bin/env zsh

echo "\nStarting Hombrew Setup\n"

# This needs to happen earlier
# xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474
brew bundle --verbose