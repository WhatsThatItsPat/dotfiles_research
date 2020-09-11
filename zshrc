echo 'Hello from .zshrc'
# blah blah blah

# Set Environment Variables (and other Surprises)
# should HOMEBREW_CASK_OPTS be in zshenv or something?
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
DOTFILES="$HOME/.dotfiles"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Probably won't do this, just exploring alternatives
# export BAT_CONFIG_PATH="$DOTFILES/bat.conf"

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
setopt histIgnoreAllDups
unsetopt appendHistory # explicit and unnecessary
setopt incAppendHistoryTime

# Completion / Menu / Directory / etc. Options
# autoMenu & autoList are on by default
setopt autoCd
setopt globDots


# Create Aliases
# alias ls='ls -lAFh'
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias trail='<<<${(F)path}'
alias ftrail='<<<${(F)fpath}'
# Load History into shell (shareHistory alternative)
alias lh='fc -RI; echo "history loaded, now showing..."; history;'


# Customize the Prompt
# PROMPT='
# %1~ %L %# '
# RPROMPT='%*'


# this works in VS Code integrated terminal
# source "spaceship_shlvl.zsh"
# this works in Terminal app
# source ".dotfiles/spaceship_shlvl.zsh"
# this works in both
source "$DOTFILES/spaceship_shlvl.zsh"

SPACESHIP_CHAR_SYMBOL="❯ "
# SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=0
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
#  node          # Node.js section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  shlvl         # Custom section from spaceship_shlvl.zsh
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exit_code
  battery
  time
)


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

# Only create Brewfile in .dotfiles directory
function bbd() {
  local startingDirectory=$PWD;

  if [[ $startingDirectory != $DOTFILES ]]; then
    echo "Changing to $DOTFILES";
    cd $DOTFILES;
  fi

  echo "Dumping Brewfile";
  brew bundle dump --force --describe;

  if [[ $startingDirectory != $DOTFILES ]]; then
    echo "Returning to $startingDirectory";
    cd $startingDirectory;
  fi

}


# Use ZSH plugins
source <(antibody init)
# this works in VS Code integrated terminal
# antibody bundle < "antibody_plugins"
# this works in Terminal app
# antibody bundle < ".dotfiles/antibody_plugins"
# this works in both
antibody bundle < "$DOTFILES/antibody_plugins"



# ...and Other Surprises

# Change Key Bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Add "zstyles" for Completions & Other Things
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ":plugin:history-search-multi-word" clear-on-cancel "yes"

# Load "New" Completion System
autoload -Uz compinit && compinit

