
if chk::command "signal"
then

else
  echo "signal not found. execute 'signal::install' to install it."

  signal::install() {
    chk::osx && pkg::install::brew::cask "signal"
    
    if chk::debian
    then
      # 1. Install our official public software signing key
      wget -O- https://updates.signal.org/desktop/apt/keys.asc |\
        sudo apt-key add -
      # 2. Add our repository to your list of repositories
      echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
        sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
      # 3. Update your package database and install signal
      sudo apt update && sudo apt install signal-desktop
    fi
  }
fi
