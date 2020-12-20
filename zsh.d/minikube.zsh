
if chk::asdf::plugin 'minikube'
then
  ;
else
  echo "minikube not found. execute 'minikube::install' to install it."

  minikube::install() {
    asdf plugin-add minikube https://github.com/russelltsherman/asdf-minikube.git

    asdf install minikube $(asdf list-all minikube) 
    asdf global minikube $(asdf list minikube)
  }

fi

