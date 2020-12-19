
# SDK for building Kubernetes applications. 
# Provides high level APIs, useful abstractions, and project scaffolding.

if chk::asdf::plugin 'operator-sdk'
then
  ;
else
  echo "operator-sdk not found. execute 'operator-sdk::install' to install it."

  operator-sdk::install() {
    asdf plugin-add operator-sdk https://github.com/Medium/asdf-operator-sdk

    asdf install operator-sdk $(asdf list-all operator-sdk | tail -1) 
    asdf global operator-sdk $(asdf list operator-sdk)
  }
fi
