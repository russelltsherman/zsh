
if chk::asdf::plugin 'helm'
then
  ;
else
  echo "helm not found. execute 'helm::install' to install it."

  helm::install() {
    asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git

    asdf install helm $(asdf list-all helm | tail -1) 
    asdf global helm $(asdf list helm)
  }
fi
