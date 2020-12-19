
if chk::asdf::plugin 'yarn'
then
  ;
else
  echo "yarn not found. execute 'yarn::install' to install it."

  yarn::install() {
    asdf plugin-add yarn https://github.com/twuni/asdf-yarn.git

    asdf install yarn $(asdf list-all yarn | tail -1)
    asdf global yarn $(asdf list yarn)
  }

fi
