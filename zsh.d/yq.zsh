
if chk::asdf::plugin 'yq'
then
  ;
else
  asdf plugin-add yq https://github.com/sudermanjr/asdf-yq.git
  asdf install yq $(asdf list-all yq | grep -v alpha | grep -v beta | tail -1)
  asdf global yq $(asdf list yq)
fi
