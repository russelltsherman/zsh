
if chk::asdf::plugin 'minikube'
then
  ;
else
  pkg::install::asdf minikube https://github.com/russelltsherman/asdf-minikube.git
fi

