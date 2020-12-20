if chk::asdf::plugin 'draft'
then
  ;
else
  asdf plugin-add draft https://github.com/kristoflemmens/asdf-draft.git
  asdf install draft $(asdf list-all draft | grep -v rc | tail -1)
  asdf global draft $(asdf list draft)
fi
