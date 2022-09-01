if chk::command "kubectl"
then
  alias k='kubectl'

  eval $(kubectl completion "zsh")
fi
