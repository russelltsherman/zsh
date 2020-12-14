
if chk::app "firefox"
then

else
  echo "firefox not found. execute 'firefox::install' to install it."

  firefox::install() {
    pkg::install "firefox"
  }
fi
