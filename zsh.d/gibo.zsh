export GIBO_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.gibo" || printf %s "${XDG_CONFIG_HOME}/gibo")"

if chk::command "gibo"
then

else
  git clone https://github.com/simonwhitaker/gibo.git $GIBO_DIR
  ln -s $GIBO_DIR/gibo ~/bin/gibo
fi
