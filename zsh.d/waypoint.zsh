
if chk::asdf::plugin 'waypoint'
then
  ;
else
  echo "waypoint not found. execute 'waypoint::install' to install it."

  waypoint::install() {
    asdf plugin-add waypoint https://github.com/Banno/asdf-hashicorp.git

    asdf install waypoint $(asdf list-all waypoint | tail -1)
    asdf global waypoint $(asdf list waypoint)
  }

fi
