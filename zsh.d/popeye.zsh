
if chk::asdf::plugin 'popeye'
then
  ;
else
  asdf plugin-add popeye https://github.com/nlamirault/asdf-popeye.git
  asdf install popeye $(asdf list-all popeye | tail -1)
  asdf global popeye $(asdf list popeye)
fi
