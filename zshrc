echo 'Hello from .zshrc'

# Set Environment Variables (and other Surprises)
# should HOMEBREW_CASK_OPTS be in zshenv or something?
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# TODO look into this
export TIME_STYLE=long-iso

# Bonus?
# Get some syntax highlighing for man pages using bat
# https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# Do I want to name these with the dot, instead
# of following the default dotbot way? Setting
# file associations for VS Code, bat, etc. is a pain.


# Adjust History Variables & Options
[ -z $HISTFILE ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=4000
setopt histNoStore
setopt extendedHistory

# History Duplication Options
# setopt histFindNoDups
# setopt histSaveNoDups
# setopt histExpireDupsFirst
# setopt histIgnoreDups
setopt histIgnoreAllDups

# History Appending & Sharing Options
# Explicitly turning off appendHistory (though I imagine
# incAppendHistory will just override it)
unsetopt appendHistory
# setopt incAppendHistory
setopt incAppendHistoryTime
# setopt shareHistory


# Create Aliases
# alias ls='ls -lAFh'
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'
# Load History into shell (shareHistory alternative)
alias lh='fc -RI; echo "history loaded, now showing..."; history;'

# Customize the Prompt
prompt='
%1~ %L %# '

# Add Locations to the $path Variable
typeset -U path
path=(
  "$N_PREFIX/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Write Handy Functions
# Create a new directory and enter it
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Use ZSH plugins
