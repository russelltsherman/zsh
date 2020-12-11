export FZF_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.fzf" || printf %s "${XDG_CONFIG_HOME}/fzf")"

if chk::command "fzf"
then
  ;
else
  echo "fzf not found. execute 'fzf::install' to install it."

  fzf::install() {
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR
    $FZF_DIR/install
  }
fi

