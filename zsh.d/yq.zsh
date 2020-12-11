
if chk::command "yq"
then
  ;
else
  echo "yq not found. execute 'yq::install' to install it."

  yq::install() {
    local version="3.4.1"
    local platform

    chk::osx && platform="darwin"
    chk::linux && platform="linux"

    wget "https://github.com/mikefarah/yq/releases/download/${version}/yq_${platform}_amd64" -O ~/bin/yq
    chmod +x ~/bin/yq
  }
fi
