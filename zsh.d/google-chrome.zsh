if chk::command "google-chrome"
then

else
  echo "google-chrome not found. execute 'google-chrome::install' to install it."

  google-chrome::install() {
    chk::osx && pkg::install::brew::cask "google-chrome"
    
    if chk::ubuntu || chk::debian
    then
      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      sudo apt install google-chrome-stable_current_amd64.deb
      rm google-chrome-stable_current_amd64.deb
    fi
  }
fi
