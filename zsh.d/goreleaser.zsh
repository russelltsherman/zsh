
if chk::asdf::plugin 'goreleaser'
then
  ;
else
  pkg::install::asdf goreleaser https://github.com/kforsthoevel/asdf-goreleaser.git
fi
