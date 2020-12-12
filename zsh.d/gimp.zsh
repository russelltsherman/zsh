
if chk::command "gimp"
then

else
  echo "gimp not found. execute 'gimp::install' to install it."

  gimp::install() {
    pkg::install "gimp"
  }
fi
