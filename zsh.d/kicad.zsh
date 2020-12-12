
if chk::command "kicad"
then

else
  echo "kicad not found. execute 'kicad::install' to install it."

  kicad::install() {
    pkg::install "kicad"
  }
fi
