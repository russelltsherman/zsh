export GARDEN_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.garden" || printf %s "${XDG_CONFIG_HOME}/garden")"

if chk::dir "$GARDEN_DIR"
then

else
  echo "garden not found. execute 'garden::install' to install it."

  garden::install() {
    local version="0.12.11"
    local platform

    chk::osx && platform="macos"
    chk::linux && platform="linux"
  
    wget https://github.com/garden-io/garden/releases/download/$version/garden-$version-$platform-amd64.tar.gz
    tar -xvf garden-$version-$platform-amd64.tar.gz
    mv "$platform-amd64" "$GARDEN_DIR"
    rm garden-$version-$platform-amd64.tar.gz

    ln -s $GARDEN_DIR/garden ~/bin
  }
fi

