
if chk::asdf::plugin 'vendir'
then
  ;
else
  echo "vendir not found. execute 'vendir::install' to install it."

  vendir::install() {
    asdf plugin-add vendir https://github.com/k14s/asdf-k14s.git

    asdf install vendir $(asdf list-all vendir | tail -1)
    asdf global vendir $(asdf list vendir)
  }

fi
