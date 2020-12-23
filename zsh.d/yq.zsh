
if chk::asdf::plugin 'yq'
then
  ;
else
  pkg::install::asdf yq https://github.com/sudermanjr/asdf-yq.git
fi
