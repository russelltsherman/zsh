
if chk::command "vagrant"
then

else
  echo "vagrant not found. execute 'vagrant::install' to install it."

  vagrant::install() {
    chk::osx && pkg::install::brew::cask "vagrant"
    chk::linux && pkg::install::linux "vagrant"
  }
fi
