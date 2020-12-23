if chk::asdf::plugin 'kubectl'
then
  eval $(kubectl completion "zsh")

else
  pkg::install::asdf kubectl https://github.com/Banno/asdf-kubectl.git
fi
