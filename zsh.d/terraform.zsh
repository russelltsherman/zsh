
if chk::asdf::plugin 'terraform'
then
  ;
else
  echo "terraform not found. execute 'terraform::install' to install it."

  terraform::install() {
    asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git

    asdf install terraform 0.12.29
    asdf install terraform 0.13.5
    asdf install terraform 0.14.3
    asdf global terraform $(asdf list terraform)
  }

fi

