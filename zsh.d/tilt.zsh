
if chk::asdf::plugin 'tilt'
then
  ;
else
  asdf plugin-add tilt https://github.com/eaceaser/asdf-tilt.git
  asdf install tilt $(asdf list-all tilt | tail -1)
  asdf global tilt $(asdf list tilt)
fi
