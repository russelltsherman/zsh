if chk::command "keybase"
then

else
  chk::osx && pkg::install::brew::cask "keybase"
  
  if chk::ubuntu || chk::debian
  then
    wget https://prerelease.keybase.io/keybase_amd64.deb -O ~/Download/keybase.deb
    sudo apt install -y ~/Download/keybase.deb
    rm ~/Download/keybase.deb
    run_keybase
  fi

fi
