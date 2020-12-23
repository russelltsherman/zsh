
if chk::asdf::plugin 'adr-tools'
then
  ;
else
  pkg::install::asdf adr-tools https://github.com/russelltsherman/asdf-adr-tools.git
fi
