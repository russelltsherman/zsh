
if chk::asdf::plugin 'packer'
then
  ;
else
  echo "packer not found. execute 'packer::install' to install it."

  packer::install() {
    asdf plugin-add packer https://github.com/Banno/asdf-hashicorp.git

    asdf install packer 1.6.6
    asdf global packer $(asdf list packer)
  }

fi

