
if chk::asdf::plugin 'hugo'
then
  ;
else
  asdf plugin-add hugo https://bitbucket.org/mgladdish/asdf-gohugo.git
  asdf install hugo $(asdf list-all hugo | grep -v _ | tail -1)
  asdf global hugo $(asdf list hugo)
fi
