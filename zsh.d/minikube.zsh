if chk::command "minikube"
then

else
  echo "minikube not found. execute 'minikube::install' to install it."

  minikube::install() {
    chk::osx && pkg::install::brew "minikube"
    
    if chk::ubuntu
    then
      curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
      sudo dpkg -i minikube_latest_amd64.deb
    fi
  }
fi
