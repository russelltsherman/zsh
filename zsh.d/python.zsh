
if chk::asdf::plugin 'python'
then
  ;
else
  echo "python not found. execute 'python::install' to install it."

  python::install() {
    asdf plugin-add python https://github.com/danhper/asdf-python.git

    asdf install python $(asdf list-all python | grep -v dev | grep -v conda | grep -v y | grep -v stackless | tail -1)
    asdf global python $(asdf list python)
  }

fi

