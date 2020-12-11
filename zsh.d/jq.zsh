
if chk::command "jq"
then
  ;
else
  echo "jq not found. execute 'jq::install' to install it."

  jq::install() {
    local version="1.6"
    local platform

    chk::osx && platform="osx-amd64"
    chk::linux && platform="linux64"

    wget "https://github.com/stedolan/yq/releases/download/yq-$version/yq-$platform" -O ~/bin/yq
    chmod +x ~/bin/yq
  }
fi
