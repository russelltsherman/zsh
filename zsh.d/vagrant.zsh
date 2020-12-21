
if chk::command "vagrant"
then
  ;
else
  chk::osx && pkg::install::brew::cask "vagrant"
  chk::debian && pkg::install::debian "vagrant"
fi
