
if chk::asdf::plugin 'waypoint'
then
  ;
else
  pkg::install::asdf waypoint https://github.com/Banno/asdf-hashicorp.git
fi
