
if chk::command "direnv"
then
  # Hook direnv into your shell.
  eval "$(asdf exec direnv hook zsh)"

  # A shortcut for asdf managed direnv.
  direnv() { 
    asdf exec direnv "$@"
  }

else
  echo "direnv not found. execute 'direnv::install' to install it."

  direnv::install() {
    asdf plugin add direnv
    asdf install direnv
    asdf global direnv $(asdf list direnv)

    cat > ~/.config/direnv/direnvrc <<- EOM
# makes the use asdf feature available
source "$(asdf direnv hook asdf)"

# Uncomment the following line to make direnv silent by default.
# export DIRENV_LOG_FORMAT=""
EOM
  }
fi
