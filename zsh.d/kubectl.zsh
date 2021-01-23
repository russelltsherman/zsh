if chk::asdf::plugin 'kubectl'
then
  eval $(kubectl completion "zsh")
fi
