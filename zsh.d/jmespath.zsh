
if chk::asdf::plugin 'jmespath'
then
  ;
else
  pkg::install::asdf jmespath https://github.com/skyzyx/asdf-jmespath
fi
