
if chk::asdf::plugin 'jmespath'
then
  ;
else
  asdf plugin-add jmespath https://github.com/skyzyx/asdf-jmespath
  asdf install jmespath $(asdf list-all jmespath | tail -1) 
  asdf global jmespath $(asdf list jmespath)
fi
