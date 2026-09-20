
eval "$(/opt/homebrew/bin/brew shellenv)"

export BUN_INSTALL="$HOME/.bun"

typeset -U path
path=(
  $HOME/.nix-profile/bin
  $HOME/.composer/vendor/bin
  /opt/homebrew/opt/ruby/bin
  $HOME/.local/bin
  $BUN_INSTALL/bin
  $HOME/.local/share/mise/shims
  $path
  $HOME/go/bin
)
