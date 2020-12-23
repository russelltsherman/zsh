
if chk::asdf::plugin 'skaffold'
then
  ;
else
  pkg::install::asdf skaffold https://github.com/kristoflemmens/asdf-skaffold.git
fi
