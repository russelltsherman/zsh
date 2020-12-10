if chk::command "draft"
then
  eval $(eksctl completion $SHELL)
else
  echo "draft not found. execute 'draft::install' to install it."

  draft::install() {
    wget "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"
    tar -xvf eksctl_$(uname -s)_amd64.tar.gz
    mv eksctl ~/bin
    rm eksctl_$(uname -s)_amd64.tar.gz
  }
fi
