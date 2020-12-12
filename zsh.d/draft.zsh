if chk::command "draft"
then

else
  echo "draft not found. execute 'draft::install' to install it."

  draft::install() {
    local version="0.16.0"
    local platform

    chk::osx && platform="darwin"
    chk::linux && platform="linux"

    wget https://azuredraft.blob.core.windows.net/draft/draft-v${version}-${platform}-amd64.tar.gz -O draft.tar.gz
    tar -xvf draft.tar.gz
    mv ${platform}-amd64/draft ~/bin
    rm -rf ${platform}-amd64
    rm draft.tar.gz
  }
fi
