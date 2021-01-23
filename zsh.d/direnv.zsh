
if chk::asdf::plugin "direnv"
then
  # Hook direnv into your shell.
  eval "$(asdf exec direnv hook zsh)"

  # A shortcut for asdf managed direnv.
  direnv() { 
    asdf exec direnv "$@"
  }
fi
