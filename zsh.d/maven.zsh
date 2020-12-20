
if chk::asdf::plugin 'maven'
then
  ;
else
  asdf plugin-add maven https://github.com/halcyon/asdf-maven.git
  asdf install maven $(asdf list-all maven | grep -v alpha | grep -v beta | tail -1)
  asdf global maven $(asdf list maven)
fi
