
if chk::asdf::plugin 'packer'
then
  ;
else
  pkg::install::asdf packer https://github.com/Banno/asdf-hashicorp.git
fi
