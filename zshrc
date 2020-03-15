echo 'Hello a 3rd time from .zshrc'

# Create aliases
# alias ls='ls -lAFh'
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'

# Customize the prompt
prompt='
%1~ %L %# '

# Add locations to the $PATH variable
  # Add Visual Studio Code (code)
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Write handy functions


# Use ZSH plugins


# We'll see? Bonus stuff...
# should this be in zshenv or something?
export HOMEBREW_CASK_OPTS="--no-quarantine"
