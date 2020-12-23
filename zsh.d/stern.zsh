
if chk::asdf::plugin 'stern'
then
  ;
else
  pkg::install::asdf stern https://github.com/russelltsherman/asdf-stern
fi
