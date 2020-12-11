if chk::command "eksctl"
then
  eval $(eksctl completion $SHELL)
else
  echo "eksctl not found. execute 'eksctl::install' to install it."

  eksctl::install() {
    wget "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"
    tar -xvf eksctl_$(uname -s)_amd64.tar.gz
    mv eksctl ~/bin
    rm eksctl_$(uname -s)_amd64.tar.gz
  }
fi
