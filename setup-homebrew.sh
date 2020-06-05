#!/usr/bin/env zsh

echo "\n~~~ Starting Hombrew Setup ~~~\n"

# This needs to happen earlier
# xcode-select --install


if exists brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


# TODO: Keep an eye out for a different `--no-quarantine` solution.
# It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474
brew bundle --verbose



# Post-Homebrew Items...better name?
# This can be for app-related things that don't fit elsewhere. The iTerm stuff uses the defaults api so is good in macos_setup.

# compaudit
echo "fix any compaudit issues?"
# https://docs.brew.sh/Shell-Completion
# chmod go-w "$(brew --prefix)/share"
# compaudit | xargs chmod g-w

# Put this in a conditional to see if xcodebuild exists?
echo "Enter password to accept Xcode license"
sudo xcodebuild -license accept

echo "Installing VS Code Extentions"
cat vscode_extensions | xargs -L 1 code --install-extension


# should I have an exit here?