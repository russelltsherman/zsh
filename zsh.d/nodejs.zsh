
if chk::asdf::plugin 'nodejs'
then
  ;
else
  echo "nodejs not found. execute 'nodejs::install' to install it."

  nodejs::install() {
    chk::osx && pkg::install::brew 'coreutils'
    chk::osx && pkg::install::brew 'gpg'

    chk::debian && pkg::install::debian 'curl dirmngr gpg'

    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    bash -c '${ASDF_DATA_DIR}/plugins/nodejs/bin/import-release-team-keyring'
    bash -c '${ASDF_DATA_DIR}/plugins/nodejs/bin/import-previous-release-team-keyring'

    asdf install nodejs $(asdf list-all nodejs | tail -1)
    asdf global nodejs $(asdf list nodejs)
  }

fi

