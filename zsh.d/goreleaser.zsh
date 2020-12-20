
if chk::asdf::plugin 'goreleaser'
then
  ;
else
  asdf plugin-add goreleaser https://github.com/kforsthoevel/asdf-goreleaser.git
  asdf install goreleaser $(asdf list-all goreleaser | tail -1) 
  asdf global goreleaser $(asdf list goreleaser)
fi
