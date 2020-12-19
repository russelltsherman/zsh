
if chk::asdf::plugin 'adr-tools'
then
  ;
else
  echo "adr-tools not found. execute 'adr-tools::install' to install it."

  adr-tools::install() {
    asdf plugin-add adr-tools https://gitlab.com/td7x/asdf/adr-tools.git

    asdf install adr-tools 3.0.0
    asdf global adr-tools $(asdf list adr-tools)
  }
fi
