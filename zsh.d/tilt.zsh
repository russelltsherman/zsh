
if chk::command "tilt"
then
  ;
else
  echo "tilt not found. execute 'tilt::install' to install it."

  tilt::install() {
    curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
  }
fi
