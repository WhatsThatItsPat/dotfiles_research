#!/usr/bin/env zsh

echo "\n~~~ Starting ZSH Setup ~~~\n"

# Installation unnecessary; it's already in Brewfile.

# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
  echo '/usr/local/bin/zsh already exists in /etc/shells'
else
  echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells'
fi

if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
  echo '$SHELL is already /usr/local/bin/zsh'
else
  chsh -s /usr/local/bin/zsh
fi
