
if chk::asdf::plugin 'vendir'
then
  ;
else
  pkg::install::asdf vendir https://github.com/k14s/asdf-k14s.git
fi
