
if chk::asdf::plugin 'python'
then
  ;
else
  echo "python not found. execute 'python::install' to install it."

  python::install() {
    asdf plugin-add python https://github.com/danhper/asdf-python.git

    asdf install python 3.9.1
    asdf global python $(asdf list python)
  }

fi

