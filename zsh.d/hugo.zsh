
if chk::asdf::plugin 'hugo'
then
  ;
else
  pkg::install::asdf hugo https://bitbucket.org/mgladdish/asdf-gohugo.git
fi
