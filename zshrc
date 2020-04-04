echo 'Hello from .zshrc'

# for testing the Inherit Env stuff
# echo "Path?: $PATH"

# Do I want to name these with the dot, instead
# of following the default dotbot way? Setting
# file associations for VS Code, bat, etc. is a pain.

# Adjust History Settings
setopt histNoStore


# Set ZSH Options


# Set Environment Variables (and other Surprises)
# should this be in zshenv or something?
export HOMEBREW_CASK_OPTS="--no-quarantine"

export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"


# Create aliases
# alias ls='ls -lAFh'
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'

# Customize the prompt
prompt='
%1~ %L %# '

# Add locations to the $path variable
typeset -U path
path=(
  "$N_PREFIX/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Write handy functions
# Create a new directory and enter it
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function exaf() {
  exa $(find "$1" -name "*$2")
}


# Use ZSH plugins



# TODO look into this
export TIME_STYLE=long-iso


# Bonus?
# Get some syntax highlighing for man pages using bat
# https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"