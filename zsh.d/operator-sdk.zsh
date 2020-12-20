
# SDK for building Kubernetes applications. 
# Provides high level APIs, useful abstractions, and project scaffolding.

if chk::asdf::plugin 'operator-sdk'
then
  ;
else
  asdf plugin-add operator-sdk https://github.com/Medium/asdf-operator-sdk
  asdf install operator-sdk $(asdf list-all operator-sdk | tail -1) 
  asdf global operator-sdk $(asdf list operator-sdk)
fi
