
if chk::asdf::plugin 'skaffold'
then
  ;
else
  asdf plugin-add skaffold https://github.com/kristoflemmens/asdf-skaffold.git
  asdf install skaffold $(asdf list-all skaffold | tail -1)
  asdf global skaffold $(asdf list skaffold)
fi
