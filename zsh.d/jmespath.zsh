
if chk::asdf::plugin 'jmespath'
then
  ;
else
  echo "jmespath not found. execute 'jmespath::install' to install it."

  jmespath::install() {
    asdf plugin-add jmespath https://github.com/skyzyx/asdf-jmespath

    asdf install jmespath $(asdf list-all jmespath | tail -1) 
    asdf global jmespath $(asdf list jmespath)
  }
fi
