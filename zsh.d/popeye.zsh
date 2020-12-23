
if chk::asdf::plugin 'popeye'
then
  ;
else
  pkg::install::asdf popeye https://github.com/nlamirault/asdf-popeye.git
fi
