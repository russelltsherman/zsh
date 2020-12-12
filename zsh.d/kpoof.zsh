export KPOOF_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.kpoof" || printf %s "${XDG_CONFIG_HOME}/kpoof")"

if chk::command "kpoof"
then

else
  echo "kpoof not found. execute 'kpoof::install' to install it."

  kpoof::install() {
    git clone https://github.com/farmotive/kpoof $KPOOF_DIR
    ln -s $KPOOF_DIR/kpoof ~/bin
  }
fi

