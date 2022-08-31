if chk::command "kubectl"
then
  alias kc='kubectl'

  eval $(kubectl completion "zsh")
fi
