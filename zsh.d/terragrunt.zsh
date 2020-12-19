
if chk::asdf::plugin 'terragrunt'
then
  ;
else
  echo "terragrunt not found. execute 'terragrunt::install' to install it."

  terragrunt::install() {
    asdf plugin-add terragrunt https://github.com/lotia/asdf-terragrunt.git

    asdf install terragrunt 0.23.40
    asdf install terragrunt 0.24.4
    asdf install terragrunt 0.25.5
    asdf install terragrunt 0.26.7
    asdf global terragrunt $(asdf list terragrunt)
  }

fi

