
if chk::asdf::plugin 'tilt'
then
  ;
else
  echo "tilt not found. execute 'tilt::install' to install it."

  tilt::install() {
    asdf plugin-add tilt https://github.com/eaceaser/asdf-tilt.git

    asdf install tilt $(asdf list-all tilt | tail -1)
    asdf global tilt $(asdf list tilt)
  }

fi
