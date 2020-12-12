if chk::command "skaffold"
then
  ;
else
  echo "skaffold not found. execute 'skaffold::install' to install it."

  skaffold::install() {
    local version="1.17.2"
    local platform

    chk::osx && platform="darwin"
    chk::linux && platform="linux"

    wget https://github.com/GoogleContainerTools/skaffold/releases/download/v${version}/skaffold-${platform}-amd64
    mv skaffold-${platform}-amd64 ~/bin/skaffold
  }
fi
