# i don't care for this installing into $HOME
# i would prefer sending it to XDG_CONFIG_HOME
# export KREW_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.krew" || printf %s "${XDG_CONFIG_HOME}/krew")"

if chk::dir "${HOME}/.krew/bin"
then
  export PATH="${PATH}:${HOME}/.krew/bin"
else
  if chk::command "kubectl"
  then
    echo "krew not found. execute 'krew::install' to install it."

    krew::install() {
      wget "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz"
      tar zxvf krew.tar.gz

      KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')"
      "$KREW" install krew
      rm -rf krew*

      kubectl krew install ctx # kubectl ctx
      kubectl krew install ns # kubectl ns

      # look for more useful plugins
      # https://krew.sigs.k8s.io/plugins/
    }
  fi
fi
