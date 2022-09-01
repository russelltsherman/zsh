if chk::command "minikube"
then
  alias mk='minikube'

  eval $(minikube completion "zsh")
fi
