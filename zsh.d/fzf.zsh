
if chk::asdf::plugin 'fzf'
then
  fzf_version=$(asdf current fzf | awk '{print $2}')
  FZF_DIR="$ASDF_DATA_DIR/installs/fzf/${fzf_version}/"

  # Setup fzf
  [[ ! "${PATH}" == *${FZF_DIR}/bin* ]] && export PATH="${PATH:+${PATH}:}${FZF_DIR}/bin"
  # Auto-completion
  [[ $- == *i* ]] && source "${FZF_DIR}/shell/completion.zsh" 2> /dev/null
  # Key bindings
  source "${FZF_DIR}/shell/key-bindings.zsh"

else
  asdf plugin-add fzf https://github.com/russelltsherman/asdf-fzf.git
  asdf install fzf $(asdf list-all fzf | grep -v alpha | tail -f)
  asdf global fzf $(asdf list fzf)
fi
