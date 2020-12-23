
# SDK for building Kubernetes applications. 
# Provides high level APIs, useful abstractions, and project scaffolding.

if chk::asdf::plugin 'operator-sdk'
then
  ;
else
  pkg::install::asdf operator-sdk https://github.com/Medium/asdf-operator-sdk
fi
