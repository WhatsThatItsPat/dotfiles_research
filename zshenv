echo 'Hello from .zshenv'

# Write handy functions

function exists() {
  # "which" command is probably the same
  # command -v $1 >/dev/null 2>&1
  # or more explicitly written...
  command -v $1 1>/dev/null 2>/dev/null
}
