export DROPBOX_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.dropbox" || printf %s "${XDG_CONFIG_HOME}/dropbox")"

if chk::command "dropbox"
then

else
  echo "dropbox not found. execute 'dropbox::install' to install it."

  dropbox::install() {
    chk::osx && pkg::install::brew::cask "dropbox"
    
    if chk::linux
    then
      ( cd $DROPBOX_DIR && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - )
      $DROPBOX_DIR/.dropbox-dist/dropboxd

      wget https://www.dropbox.com/download?dl=packages/dropbox.py -O ~/bin/dropbox
    fi
  }
fi
