if chk::command "yarn"
then
  PATH="${PATH}:$(yarn global bin)"
  export PATH

else
  echo "yarn not found. execute 'yarn::install' to install it."

  yarn::install() {
    chk::osx && pkg::install::brew "yarn"

    if chk::debian || chk::ubuntu
    then
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
      sudo apt update && sudo apt install -y yarn
    fi
  }
fi
