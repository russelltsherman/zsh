export FZF_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.fzf" || printf %s "${XDG_CONFIG_HOME}/fzf")"

if chk::command "fzf"
then
  # Setup fzf
  [[ ! "${PATH}" == *${FZF_DIR}/bin* ]] && export PATH="${PATH:+${PATH}:}${FZF_DIR}/bin"
  # Auto-completion
  [[ $- == *i* ]] && source "${FZF_DIR}/shell/completion.zsh" 2> /dev/null
  # Key bindings
  source "${FZF_DIR}/shell/key-bindings.zsh"

else
  echo "fzf not found. execute 'fzf::install' to install it."

  fzf::install() {
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR
    $FZF_DIR/install
  }
fi

