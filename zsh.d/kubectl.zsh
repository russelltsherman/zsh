if chk::asdf::plugin 'kubectl'
then
  eval $(kubectl completion "zsh")

else
  echo "kubectl not found. execute 'kubectl::install' to install it."

  kubectl::install() {
    asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git

    asdf install kubectl 0.16.15
    asdf install kubectl 0.17.16
    asdf install kubectl 0.18.14
    asdf install kubectl 0.19.6
    asdf install kubectl 0.20.1
    asdf global kubectl $(asdf list kubectl)
  }
fi
