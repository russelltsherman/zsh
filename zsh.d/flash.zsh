
if chk::command "flash"
then

else
  echo "flash not found. execute 'flash::install' to install it."

  flash::install() {
    chk:osx && pkg::install::brew "pv"
    chk::debian && pkg::install::debian "curl hdparm pv unzip"

    wget https://github.com/hypriot/flash/releases/download/2.7.0/flash -O ~/bin/flash
    chmod +x ~/bin/flash
  }
fi
