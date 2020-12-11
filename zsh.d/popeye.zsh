if chk::command "popeye"
then
  ;
else
  echo "popeye not found. execute 'popeye::install' to install it."

  popeye::install() {
    go get github.com/derailed/popeye
  }
fi
