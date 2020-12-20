
if chk::asdf::plugin 'stern'
then
  ;
else
  asdf plugin-add stern https://github.com/russelltsherman/asdf-stern
  asdf install stern $(asdf list-all stern | tail -1)
  asdf global stern $(asdf list stern)
fi
