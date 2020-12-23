
if chk::asdf::plugin 'k9s'
then
  ;
else
  pkg::install::asdf k9s https://github.com/looztra/asdf-k9s
fi
