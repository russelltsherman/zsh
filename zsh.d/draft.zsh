if chk::command "draft"
then

else
  echo "draft not found. execute 'draft::install' to install it."

  draft::install() {
    local version="0.16.0"

    if chk::osx
    then
      wget https://azuredraft.blob.core.windows.net/draft/draft-v$version-darwin-amd64.tar.gz
      tar -xvf draft-v$version-darwin-amd64.tar.gz
      mv darwin-amd64/draft ~/bin
      rm -rf darwin-amd64
      rm draft-v$version-darwin-amd64.tar.gz
    fi
    
    if chk::ubuntu
    then
      wget https://azuredraft.blob.core.windows.net/draft/draft-v$version-linux-amd64.tar.gz
      tar -xvf draft-v$version-linux-amd64.tar.gz
      mv linux-amd64/draft ~/bin
      rm -rf linux-amd64
      rm draft-v$version-linux-amd64.tar.gz
    fi
  }
fi
