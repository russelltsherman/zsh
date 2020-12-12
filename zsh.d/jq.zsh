
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

    wget "https://github.com/stedolan/jq/releases/download/jq-$version/jq-$platform" -O ~/bin/jq
    chmod +x ~/bin/jq
  }
fi
