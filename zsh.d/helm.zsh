if [[ $commands[helm] ]]
then

else
    echo "helm not found. execute 'helm::install' to install it."

    helm::install() {
      git clone https://github.com/helm/helm.git
      make -C helm
    }
fi
