if chk::command "keybase"
then

else
  echo "keybase not found. execute 'keybase::install' to install it."

  keybase::install() {
    chk::osx && pkg::install::brew::cask "keybase"
    
    if chk::ubuntu || chk::debian
    then
      wget https://prerelease.keybase.io/keybase_amd64.deb -O ~/Download/keybase.deb
      sudo apt install ~/Download/keybase.deb
      rm ~/Download/keybase.deb
      run_keybase
    fi
  }
fi
