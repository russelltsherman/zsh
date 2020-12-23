
if chk::asdf::plugin 'sqlite'
then
  ;
else
  pkg::install::asdf sqlite https://github.com/cLupus/asdf-sqlite.git
fi
