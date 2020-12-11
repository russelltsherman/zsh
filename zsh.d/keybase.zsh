if chk::command "keybase"
then

else
  echo "keybase not found. execute 'keybase::install' to install it."

  keybase::install() {
    chk::osx && pkg::install::brew::cask "keybase"
    
    if chk::ubuntu || chk::debian
    then
      curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
      sudo apt install ./keybase_amd64.deb
      run_keybase
    fi
  }
fi
