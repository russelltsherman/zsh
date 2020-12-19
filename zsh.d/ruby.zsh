
if chk::asdf::plugin 'ruby'
then
  ;
else
  echo "ruby not found. execute 'ruby::install' to install it."

  ruby::install() {
    asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

    asdf install ruby 2.7.2
    asdf global ruby $(asdf list ruby)
  }

fi

