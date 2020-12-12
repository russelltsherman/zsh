if chk::command "minikube"
then

else
  echo "minikube not found. execute 'minikube::install' to install it."

  minikube::install() {
    chk::osx && pkg::install::brew "minikube"
    
    if chk::ubuntu
    then
      wget https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -O ~/Download/minikube.deb
      sudo apt install ~/Download/minikube.deb
      rm ~/Download/minikube.deb
    fi
  }
fi
