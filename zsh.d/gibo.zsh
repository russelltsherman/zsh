export GIBO_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.gibo" || printf %s "${XDG_CONFIG_HOME}/gibo")"

if chk::command "gibo"
then

else
  echo "gibo not found. execute 'gibo::install' to install it."

  gibo::install() {
    git clone https://github.com/simonwhitaker/gibo.git $GIBO_DIR
    ln -s $GIBO_DIR/gibo ~/bin
  }
fi
