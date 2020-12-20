
if chk::asdf::plugin 'jq'
then
  ;
else
  asdf plugin-add jq https://github.com/russelltsherman/asdf-jq.git
  asdf install jq $(asdf list-all jq | grep -v rc | tail -1)
  asdf global jq $(asdf list jq)
fi
