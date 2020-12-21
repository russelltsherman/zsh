
if chk::app "dropbox"
then
  ;
else
  chk::osx && pkg::install::brew::cask "dropbox"
  
  if chk::linux
  then
    ( cd ~/ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - )
    wget https://www.dropbox.com/download?dl=packages/dropbox.py -O ~/bin/dropbox
    ~/.dropbox-dist/dropboxd
  fi

fi
