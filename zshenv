echo 'Hello from .zshenv'

# Write handy functions

function exists() {
  # Similar to "which" which would work just as well.
  # https://stackoverflow.com/a/677212/1341838
  # command -v $1 >/dev/null 2>&1
  # or more explicitly written...
  command -v $1 1>/dev/null 2>/dev/null

  # which -s $1
}