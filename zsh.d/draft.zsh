if chk::asdf::plugin 'draft'
then
  ;
else
  pkg::install::asdf draft https://github.com/kristoflemmens/asdf-draft.git
fi
