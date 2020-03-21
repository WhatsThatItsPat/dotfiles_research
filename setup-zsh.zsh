#!/usr/bin/env zsh

echo "\n~~~ Starting ZSH Setup ~~~\n"

echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells'

chsh -s /usr/local/bin/zsh
