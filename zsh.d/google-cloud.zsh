if chk::command "google-cloud"
then

  if chk::osx
  then
    export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  fi 

else
  echo "google-cloud not found. execute 'google-cloud::install' to install it."

  google-cloud::install() {
    chk::osx && pkg::install::brew::cask "google-cloud-sdk"
    
    if chk::ubuntu || chk::debian
    then
      echo "deb https://packages.cloud.google.com/apt cloud-sdk main" \
        | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
      curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
        | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
      sudo apt-get update && sudo apt-get install google-cloud-sdk
    fi
  }
fi
