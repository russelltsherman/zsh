if [[ $commands[gibo] ]]
then

else
  echo "gibo not found. execute 'gibo::install' to install it."

  gibo::install() {
    chk::osx && pkg::install::brew "gibo"

    if chk::linux
    then
      git clone https://github.com/simonwhitaker/gibo.git ~/bin/gibo
    fi
  }
fi

