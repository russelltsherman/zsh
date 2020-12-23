
if chk::asdf::plugin 'jq'
then
  ;
else
  pkg::install::asdf jq https://github.com/russelltsherman/asdf-jq.git
fi
