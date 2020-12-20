
if chk::asdf::plugin 'adr-tools'
then
  ;
else
  echo "adr-tools not found. execute 'adr-tools::install' to install it."

  adr-tools::install() {
    asdf plugin-add adr-tools https://github.com/russelltsherman/asdf-adr-tools.git

    asdf install adr-tools $(asdf list-all adr-tools | tail -1)
    asdf global adr-tools $(asdf list adr-tools)
  }
fi
