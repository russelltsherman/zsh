if chk::command "google-cloud"
then

else
  echo "google-cloud not found. execute 'google-cloud::install' to install it."

  google-cloud::install() {
    chk::osx && pkg::install::brew::cask "google-cloud"
    
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
