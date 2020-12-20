
if chk::command "flash"
then
  ;
else
  chk:osx && pkg::install::brew "pv"
  chk::debian && pkg::install::debian "curl hdparm pv unzip"

  wget https://github.com/hypriot/flash/releases/download/2.7.0/flash -O ~/bin/flash
  chmod +x ~/bin/flash
fi
