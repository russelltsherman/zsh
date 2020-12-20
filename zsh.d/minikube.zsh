
if chk::asdf::plugin 'minikube'
then
  ;
else
  asdf plugin-add minikube https://github.com/russelltsherman/asdf-minikube.git
  asdf install minikube $(asdf list-all minikube | grep -v beta | tail -1) 
  asdf global minikube $(asdf list minikube)
fi

