
if chk::command "direnv"
then
  # Hook direnv into your shell.
  eval "$(asdf exec direnv hook zsh)"

  # A shortcut for asdf managed direnv.
  direnv() { 
    asdf exec direnv "$@"
  }

else
  asdf plugin add direnv https://github.com/russelltsherman/asdf-direnv
  asdf install direnv $(asdf list-all direnv | tail -1)
  asdf global direnv $(asdf list direnv)

  cat > ${XDG_CONFIG_HOME}/direnv/direnvrc <<- EOM
# makes the use asdf feature available
source "$(asdf direnv hook asdf)"

# Uncomment the following line to make direnv silent by default.
# export DIRENV_LOG_FORMAT=""
EOM

fi
