
if chk::asdf::plugin 'fzf'
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
    asdf plugin-add fzf https://github.com/kompiro/asdf-fzf.git

    asdf install fzf 0.24.4
    asdf global fzf $(asdf list fzf)
  }

fi
