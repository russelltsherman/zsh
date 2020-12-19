
if chk::asdf::plugin 'minikube'
then
  ;
else
  echo "minikube not found. execute 'minikube::install' to install it."

  minikube::install() {
    asdf plugin-add minikube https://github.com/alvarobp/asdf-minikube.git

    asdf install minikube v1.16.0
    asdf global minikube $(asdf list minikube)
  }

fi

