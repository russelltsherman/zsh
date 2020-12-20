if chk::asdf::plugin 'kubectl'
then
  eval $(kubectl completion "zsh")

else
  asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git
  asdf install kubectl $(asdf list-all kubectl | grep -v alpha | grep -v beta | grep -v rc | tail -1)
  asdf global kubectl $(asdf list kubectl)
fi
