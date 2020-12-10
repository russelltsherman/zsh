if chk::command "k9s"
then
  ;
else
  echo "k9s not found. execute 'k9s::install' to install it."

  k9s::install() {
    local version="0.24.2"
    local platform

    chk::osx && platform="Darwin"
    chk::linux && platform="Linux"

    wget "https://github.com/derailed/k9s/releases/download/v${version}/k9s_${platform}_x86_64.tar.gz"
    tar -xvf "k9s_${platform}_x86_64.tar.gz"
    rm "k9s_${platform}_x86_64.tar.gz"
    rm "README.md"
    rm "LICENSE"
  }
fi
