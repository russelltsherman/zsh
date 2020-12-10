if chk::command "skaffold"
then
  ;
else
  echo "skaffold not found. execute 'skaffold::install' to install it."

  skaffold::install() {
    local version="1.17.2"

    if chk::osx
    then
      wget https://github.com/GoogleContainerTools/skaffold/releases/download/v$version/skaffold-darwin-amd64
      mv skaffold-darwin-amd64 ~/bin/skaffold
    fi
    
    if chk::linux
    then
      wget https://github.com/GoogleContainerTools/skaffold/releases/download/v$version/skaffold-linux-amd64
      mv skaffold-linux-amd64 ~/bin/skaffold
    fi
  }
fi
