
if chk::asdf::plugin 'sqlite'
then
  ;
else
  asdf plugin-add sqlite https://github.com/cLupus/asdf-sqlite.git
  asdf install sqlite $(asdf list-all sqlite | tail -1) 
  asdf global sqlite $(asdf list sqlite)
fi
