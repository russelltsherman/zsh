
if chk::command "vagrant"
then

else
  chk::osx && pkg::install::brew::cask "vagrant"
  chk::linux && pkg::install::linux "vagrant"
fi
