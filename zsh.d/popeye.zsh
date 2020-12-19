
if chk::asdf::plugin 'popeye'
then
  ;
else
  echo "popeye not found. execute 'popeye::install' to install it."

  popeye::install() {
    asdf plugin-add popeye https://github.com/nlamirault/asdf-popeye.git

    asdf install popeye $(asdf list-all popeye | tail -1)
    asdf global popeye $(asdf list popeye)
  }
fi
