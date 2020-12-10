if chk::command "kubectl"
then
  ;
else
  echo "kubectl not found. execute 'kubectl::install' to install it."

  kubectl::install() {
    local version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
    local platform

    chk::osx && platform="darwin"
    chk::linux && platform="linux"

    wget "https://storage.googleapis.com/kubernetes-release/release/$version/bin/$platform/amd64/kubectl"
    chmod +x kubectl
    mv kubectl ~/bin/kubectl
  }
fi
