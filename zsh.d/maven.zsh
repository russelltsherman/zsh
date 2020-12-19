
if chk::asdf::plugin 'maven'
then
  ;
else
  echo "maven not found. execute 'maven::install' to install it."

  maven::install() {
    asdf plugin-add maven https://github.com/halcyon/asdf-maven.git

    asdf install maven $(asdf list-all maven | tail -1)
    asdf global maven $(asdf list maven)
  }

fi
