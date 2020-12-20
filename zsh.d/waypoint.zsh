
if chk::asdf::plugin 'waypoint'
then
  ;
else
  asdf plugin-add waypoint https://github.com/Banno/asdf-hashicorp.git
  asdf install waypoint $(asdf list-all waypoint | tail -1)
  asdf global waypoint $(asdf list waypoint)
fi
